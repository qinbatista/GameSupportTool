import sys
import os
import platform
import zipfile
import shutil
def PythonLocation():
	return os.path.dirname(os.path.realpath(__file__))
def main():
	#PythonFunction.FuncFunctionList.CleanCache()
	#PythonFunction.FuncFunctionList.RestSetting()
	os.chdir(PythonLocation())
	if os.path.isfile(os.path.dirname(os.path.realpath(__file__))+"/game.jar"):
		os.remove("game.jar")
	os.system("gradle clean makejar")
	if os.path.isfile("east2west/build/outputs/jar/game.jar"):
		os.rename("east2west/build/outputs/jar/game.jar",PythonLocation()+"/game.jar")
		DeleteSignature(PythonLocation()+"/game.jar")
def DeleteSignature(_APKLocation):
	#os.chdir(r''+"C:/MyProject/AgileTools")
	#APKname = _APKLocation.split("/")[-1]
	#PointCount = APKname.rfind(".")
	#foldername=APKname[:PointCount]
	your_delet_file="BuildConfig.class"
	
	old_zipfile=_APKLocation #旧文件
	new_zipfile=_APKLocation+"temp" #新文件
	zin = zipfile.ZipFile (old_zipfile, 'r') #读取对象
	zout = zipfile.ZipFile (new_zipfile, 'w') #被写入对象
	for item in zin.infolist():
		buffer = zin.read(item.filename)
		if ((your_delet_file in item.filename)):
			pass
		else:
			zout.writestr(item, buffer) #把文件写入到新对象中
	zout.close()
	zin.close()
	print("Deleted BuildConfig.class")
	#用新文件覆盖旧文件
	shutil.move(new_zipfile,old_zipfile)

if __name__ == '__main__':
    main()
"""
@echo off
if exist game-release.apk (DEL game-release.apk)
call .\gradlew.bat clean assemblerelease
MOVE app\build\outputs\apk\release\app-release.apk game-release.apk
"""
