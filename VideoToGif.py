import sys
import os
import platform
import shutil


def main():
    # CheckString = "/Users/batista/Desktop/UnityGame_Android_BASE_Android_BASE_Android_SHOW_ChuanShanJia.apk"
    path = sys.argv[1]

    # Get the directory (path) of the file
    directory = os.path.dirname(path)

    # Get the filename without extension
    filename_without_extension = os.path.basename(path).split('.')[0]

    # Get the file extension
    file_extension = os.path.splitext(path)[1]
    if os.path.exists(f"{directory}/{filename_without_extension}.gif"):
        shutil.rmtree(path)
    os.system(f"ffmpeg -ss 00:00:00.000 -i {path} -pix_fmt rgb24 -r 10 -s 1280x960 -t 00:00:10.000 {directory}/{filename_without_extension}.gif")


if __name__ == '__main__':
    main()
