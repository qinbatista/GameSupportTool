import sys, os, platform
import shutil
import zipfile
def DeleteSignature(_APKLocation):
	#os.chdir(r''+"C:\MyProject\AgileTools")
	_APKLocation = _APKLocation.replace("\\","/")
	APKname = _APKLocation.split("/")[-1]
	PointCount = APKname.rfind(".")
	# foldername=APKname[:PointCount]
	APKname[:PointCount]
	your_delet_file="META-INF"
	old_zipfile=_APKLocation #旧文件
	new_zipfile=_APKLocation+"temp" #新文件
	zin = zipfile.ZipFile (old_zipfile, 'r') #读取对象
	zout = zipfile.ZipFile (new_zipfile, 'w') #被写入对象
	for item in zin.infolist():
		buffer = zin.read(item.filename)
		if ((your_delet_file in item.filename) and (".RSA" in item.filename)) or ((your_delet_file in item.filename)and (".SF" in item.filename)) or ((your_delet_file in item.filename) and (".MF" in item.filename)):  #剔除要删除的文件
			pass
		else:
			zout.writestr(item, buffer) #把文件写入到新对象中
	zout.close()
	zin.close()
	print("Deleted Signature")
	#用新文件覆盖旧文件
	shutil.move(new_zipfile,old_zipfile)

def main():
	print("Input keystore path:")
	_key_path = input()#"/Users/batista/Desktop/test.keystore"
	_apk_path = sys.argv[1]#input()#"/Users/batista/Desktop/stack_v2_20200506.apk"
	file_path = _apk_path[:_apk_path.rfind("/")]
	DeleteSignature(_apk_path)
	file_name = os.path.splitext(_apk_path)[0][os.path.splitext(_apk_path)[0].rfind("/")+1:]
	print("jarsigner -verbose -keystore " + _key_path +" -storepass singmaan -signedjar " + _apk_path + "_" + file_name+".apk -digestalg SHA1 -sigalg MD5withRSA " + _apk_path + " android.keystore")
	os.system("jarsigner -verbose -keystore " + _key_path +" -storepass singmaan -signedjar " + _apk_path + "_" + file_name+".apk -digestalg SHA1 -sigalg MD5withRSA " + _apk_path + " android.keystore")


if __name__ == '__main__':
    main()