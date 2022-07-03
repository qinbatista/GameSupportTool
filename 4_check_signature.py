import os
import sys
import re
import shutil
import xml.dom.minidom
import subprocess

def	ListFolder(path):
	List = []
	for i in os.listdir(path):
		List.append(i)
	return List

def DeleteFolder(src):
	'''delete files and folders'''
	if os.path.isfile(src):
		try:
			os.remove(src)
		except:
			pass
	elif os.path.isdir(src):
		for item in os.listdir(src):
			itemsrc=os.path.join(src,item)
			DeleteFolder(itemsrc) 
		try:
			os.rmdir(src)
		except:
			pass
def PythonLocation():
	return os.path.dirname(os.path.realpath(__file__))
CallMethodPath=""
def Unzip(CheckString):
	file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
	file_path = CheckString[:CheckString.rfind("/")]
	if os.path.exists(file_path+"/"+file_name) and file_name!='':
		shutil.rmtree(file_path+"/"+file_name)
		os.mkdir(file_path+"/"+file_name)
	else:
		os.mkdir(file_path+"/"+file_name)
	# p = subprocess.Popen(f"unzip {CheckString} -d {file_path}/{file_name}", stdout=subprocess.PIPE, shell=True)
	# p.wait()
	os.system(f"unzip {CheckString} -d {file_path}/{file_name}")
	os.system("-----------------------------------------------")
	return f"{file_path}/{file_name}"

def DecopileAPK(CheckString):
	file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
	file_path = CheckString[:CheckString.rfind("/")]
	if os.path.exists(file_path+"/"+file_name) and file_name!='':
		shutil.rmtree(file_path+"/"+file_name)
	os.chdir(f"{file_path}")
	p = subprocess.Popen("apktool d "+CheckString, stdout=subprocess.PIPE, shell=True)
	p.wait()
	# var = os.system("apktool d "+CheckString)


def GetPackageName(CheckString):
	file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
	file_path = CheckString[:CheckString.rfind("/")]
	dom = xml.dom.minidom.parse(f"{file_path}/{file_name}/AndroidManifest.xml")
	root = dom.documentElement
	stringForTem = root.getAttribute("package")
	return stringForTem

def SignatureCommond(zip_folder):
	if os.path.exists(zip_folder+"/META-INF")==False:
		print("Your APK don't have META-INF folder")
		return
	MySignature = ListFolder(zip_folder+"/META-INF")
	for name in MySignature:
		if ".RSA" in name:
			os.system("keytool -printcert -file "+zip_folder+"/META-INF/"+name)

def GetVCVN(CheckString):
	file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
	file_path = CheckString[:CheckString.rfind("/")]
	StringList = []
	if os.path.isfile(f"{file_path}/{file_name}/apktool.yml"):
		file_object = open(f"{file_path}/{file_name}/apktool.yml",encoding="utf8")
		try:
			all_the_text = file_object.readlines()
			for i in all_the_text:
				if "versionCode" in i:
					StringList.append(i)
				if "versionName" in i:
					StringList.append(i)
		finally:
			file_object.close( )
	return StringList

def check(_APKLocation):
	SignatureCommond(Unzip(_APKLocation))
	DecopileAPK(_APKLocation)
	print("-----------------------")
	print("  Package Name:  "+GetPackageName(_APKLocation)+"\n")
	List = GetVCVN(_APKLocation)
	print(List[0])
	print(List[1])
	file_name = os.path.splitext(_APKLocation)[0][os.path.splitext(_APKLocation)[0].rfind("/")+1:]
	file_path = _APKLocation[:_APKLocation.rfind("/")]
	if os.path.exists(file_path+"/"+file_name) and file_name!='':
		shutil.rmtree(file_path+"/"+file_name)

if __name__=='__main__':
	game_name = sys.argv[1]
	check(game_name)