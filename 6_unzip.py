import sys, os, platform
import shutil
def main():
	# CheckString = "/Users/batista/Desktop/UnityGame_Android_BASE_Android_BASE_Android_SHOW_ChuanShanJia.apk"
	CheckString = sys.argv[1]
	file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
	file_path = CheckString[:CheckString.rfind("/")]
	if os.path.exists(file_path+"/"+file_name) and file_name!='':shutil.rmtree(file_path+"/"+file_name) 
	os.system(f"unzip {CheckString} -d {file_path}/{file_name}")
if __name__ == '__main__':
	main()