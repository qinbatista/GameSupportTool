import sys
import os
import shutil
import subprocess
from moviepy.editor import VideoFileClip


def get_video_resolution(video_path):
    # Use moviepy to get the video resolution
    try:
        clip = VideoFileClip(video_path)
        width, height = clip.size
        clip.close()
        return width, height
    except Exception as e:
        raise RuntimeError(f"Error getting video resolution: {e}")


def calculate_scaled_resolution(width, height, scale_factor=0.5):
    # Scale the resolution proportionally while maintaining the aspect ratio
    return int(width * scale_factor), int(height * scale_factor)


def create_optimized_gif(path, gif_path, scaled_resolution, duration=10, fps=5, colors=128):
    palette_path = f"{os.path.splitext(gif_path)[0]}_palette.png"
    scaled_width, scaled_height = scaled_resolution

    # Step 1: Create a color-optimized palette from the video, applying the scaled resolution and fewer colors
    os.system(f'ffmpeg -y -t {duration} -i "{path}" -vf fps={fps},scale={scaled_width}:{scaled_height}:flags=lanczos,palettegen=max_colors={colors} "{palette_path}"')

    # Step 2: Use the palette to create the optimized GIF with fewer colors and dithering
    os.system(
        f'ffmpeg -y -t {duration} -i "{path}" -i "{palette_path}" -lavfi "fps={fps},scale={scaled_width}:{scaled_height}:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5" "{gif_path}"'
    )

    # Remove the palette file after creating the gif
    if os.path.exists(palette_path):
        os.remove(palette_path)


def main():
    path = sys.argv[1]

    # Get the directory (path) of the file
    directory = os.path.dirname(path)

    # Get the filename without extension
    filename_without_extension = os.path.basename(path).split(".")[0]

    # Check if the GIF already exists and remove it if necessary
    gif_path = f"{directory}/{filename_without_extension}.gif"
    if os.path.exists(gif_path):
        os.remove(gif_path)

    # Get the resolution of the video
    try:
        width, height = get_video_resolution(path)
        print(f"Original resolution: {width}x{height}")

        # Calculate the scaled resolution, e.g., downscaling by 50%
        scaled_width, scaled_height = calculate_scaled_resolution(width, height, scale_factor=0.5)
        print(f"Scaled resolution: {scaled_width}x{scaled_height}")

    except Exception as e:
        print(f"Error getting video resolution: {e}")
        return

    # Create the optimized GIF with multiple size reduction strategies
    create_optimized_gif(path, gif_path, (scaled_width, scaled_height), duration=10, fps=5, colors=128)


if __name__ == "__main__":
    main()
