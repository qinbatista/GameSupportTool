import sys
import os
import subprocess


class VideoToGifConverter:
    def __init__(self, video_path, scale_factor=0.5, duration=None, fps=5, colors=64, speed_factor=1, dither_method="none"):  # None means process the whole video
        self.video_path = video_path
        self.scale_factor = scale_factor
        self.duration = duration  # Duration of the input video to process
        self.fps = fps
        self.colors = colors
        self.speed_factor = speed_factor
        self.dither_method = dither_method
        self.directory = os.path.dirname(video_path)
        self.filename_without_extension = os.path.splitext(os.path.basename(video_path))[0]
        self.temp_video_path = os.path.join(self.directory, f"{self.filename_without_extension}_temp.mp4")
        self.gif_path = os.path.join(self.directory, f"{self.filename_without_extension}.gif")
        self.palette_path = os.path.join(self.directory, f"{self.filename_without_extension}_palette.png")

    def get_video_resolution(self, video_path=None):
        """Retrieve the video resolution using ffprobe."""
        if video_path is None:
            video_path = self.video_path
        try:
            cmd = ["ffprobe", "-v", "error", "-select_streams", "v:0", "-show_entries", "stream=width,height", "-of", "csv=s=x:p=0", video_path]
            output = subprocess.check_output(cmd).decode().strip()
            width, height = map(int, output.split("x"))
            return width, height
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error getting video resolution: {e}")

    def get_video_duration(self, video_path=None):
        """Retrieve the total duration of the video using ffprobe."""
        if video_path is None:
            video_path = self.video_path
        try:
            cmd = ["ffprobe", "-v", "error", "-show_entries", "format=duration", "-of", "default=noprint_wrappers=1:nokey=1", video_path]
            output = subprocess.check_output(cmd).decode().strip()
            total_duration = float(output)
            return total_duration
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error getting video duration: {e}")

    def calculate_scaled_resolution(self, width, height):
        """Scale the resolution proportionally while maintaining the aspect ratio."""
        return int(width * self.scale_factor), int(height * self.scale_factor)

    def remove_existing_gif(self):
        """Remove the existing GIF if it exists."""
        if os.path.exists(self.gif_path):
            os.remove(self.gif_path)

    def adjust_video_speed(self):
        """Adjust the video playback speed and create a new temporary video file."""
        try:
            # Build the ffmpeg command to adjust the speed
            cmd = ["ffmpeg", "-y", "-i", self.video_path, "-filter:v", f"setpts=(1/{self.speed_factor})*PTS", "-an", self.temp_video_path]  # Remove audio to simplify processing
            subprocess.run(cmd, check=True)
            print(f"Adjusted video speed by a factor of {self.speed_factor}")
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error adjusting video speed: {e}")

    def create_gif_from_temp_video(self):
        """Create the GIF from the sped-up temporary video."""
        # Get the resolution of the temporary video
        width, height = self.get_video_resolution(video_path=self.temp_video_path)
        scaled_width, scaled_height = self.calculate_scaled_resolution(width, height)

        # Build the filter chain
        filters = [f"fps={self.fps}", f"scale={scaled_width}:{scaled_height}:flags=lanczos"]
        filter_str = ",".join(filters)

        # Generate the palette
        try:
            cmd_palette = ["ffmpeg", "-y", "-i", self.temp_video_path, "-vf", f"{filter_str},palettegen=max_colors={self.colors}:reserve_transparent=0", self.palette_path]
            subprocess.run(cmd_palette, check=True)
            print("Generated color palette for GIF.")
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error generating palette: {e}")

        # Create the GIF using the palette
        try:
            cmd_gif = ["ffmpeg", "-y", "-i", self.temp_video_path, "-i", self.palette_path, "-lavfi", f"{filter_str}[x];[x][1:v]paletteuse=dither={self.dither_method}", "-loop", "0", self.gif_path]
            subprocess.run(cmd_gif, check=True)
            print(f"GIF created at {self.gif_path}")
        except subprocess.CalledProcessError as e:
            raise RuntimeError(f"Error creating GIF: {e}")
        finally:
            # Remove the palette file
            if os.path.exists(self.palette_path):
                os.remove(self.palette_path)

    def convert(self):
        """Main method to handle the conversion process."""
        self.remove_existing_gif()
        try:
            # Step 1: Adjust the video speed
            self.adjust_video_speed()

            # Step 2: Create the GIF from the temporary sped-up video
            self.create_gif_from_temp_video()
        except RuntimeError as e:
            print(str(e))
            sys.exit(1)
        finally:
            # Clean up the temporary video file
            if os.path.exists(self.temp_video_path):
                os.remove(self.temp_video_path)
                print("Removed temporary video file.")


def main():
    if len(sys.argv) < 2:
        print("Usage: python script.py <video_path> [options]")
        sys.exit(1)
    video_path = sys.argv[1]

    # Default parameters
    params = {
        "scale_factor": 0.5,
        "duration": None,  # None means process the whole video
        "fps": 5,
        "colors": 64,
        "speed_factor": 2,  # Default is 1; change to desired value or pass via command line
        "dither_method": "none",
    }

    # Parse additional command-line arguments
    arg_map = {
        "--scale": "scale_factor",
        "--duration": "duration",
        "--fps": "fps",
        "--colors": "colors",
        "--speed": "speed_factor",
        "--dither": "dither_method",
    }

    i = 2
    while i < len(sys.argv):
        arg = sys.argv[i]
        if arg in arg_map and i + 1 < len(sys.argv):
            value = sys.argv[i + 1]
            key = arg_map[arg]
            if key in ["scale_factor", "duration", "fps", "colors", "speed_factor"]:
                params[key] = float(value) if "." in value else int(value)
            else:
                params[key] = value
            i += 2
        else:
            print(f"Invalid argument or missing value: {arg}")
            sys.exit(1)

    converter = VideoToGifConverter(
        video_path,
        scale_factor=params["scale_factor"],
        duration=params["duration"],
        fps=params["fps"],
        colors=params["colors"],
        speed_factor=params["speed_factor"],
        dither_method=params["dither_method"],
    )
    converter.convert()


if __name__ == "__main__":
    main()
