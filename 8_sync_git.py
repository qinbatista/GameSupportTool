import sys, os, platform
import shutil
def PythonLocation():
	return os.path.dirname(os.path.realpath(__file__))

def	__list_folder(_path):
	List = []
	for i in os.listdir(_path):
		List.append(i)
	return List
def main():
	os.chdir(PythonLocation())
	with open(f"./CodeAddress.txt",encoding="utf8") as file_object:
		sdk_xml = file_object.readlines()
		for i in sdk_xml:
			if i.find("git clone ssh://")!=-1:
				print("downloading codes")
				os.system(i)
	folder_names = __list_folder("./")
	for folder_name in folder_names:
		if os.path.isdir(PythonLocation()+"/"+folder_name):
			print("syncing "+folder_name)
			os.chdir("./"+folder_name)
			os.system("git pull")
			os.chdir("./../")



if __name__ == '__main__':
	main()