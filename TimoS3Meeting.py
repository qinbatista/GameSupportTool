import subprocess
import sys
import os


def main():
    path = sys.argv[1]

    # Get the directory (path) of the file
    directory = os.path.dirname(path)

    # Get the filename without extension
    filename_without_extension = os.path.basename(path).split('.')[0]

    # Get the file extension
    file_extension = os.path.splitext(path)[1]

    max_retries = 9999
    retry_count = 0
    upload_failed_keyword = "upload failed"  # The keyword to check in the output
    if(filename_without_extension==""):
        command = f"aws s3 cp {directory} s3://thisismyoregon/Meeting/{filename_without_extension}{file_extension} --recursive"
    else:
        command = f"aws s3 cp {directory}/{filename_without_extension}{file_extension} s3://thisismyoregon/Meeting/{filename_without_extension}{file_extension} "
    print(command)
    while retry_count < max_retries:
        try:
            result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            output = result.stdout.decode()

            if upload_failed_keyword in output.lower():
                print("Upload failed, retrying...")
                retry_count += 1
            else:
                print("Upload successful.")
                break
        except subprocess.CalledProcessError as e:
            print(f"Command failed with: {e.output.decode()}")
            retry_count += 1

    if retry_count == max_retries:
        print("Failed to upload after multiple attempts.")

if __name__ == '__main__':
    main()
