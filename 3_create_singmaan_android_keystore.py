from PIL import Image
import os
import sys
import re

def	ListFolder(path):
	List = []
	for i in os.listdir(path):
		List.append(i)
	return List

def PythonLocation():
	return os.path.dirname(os.path.realpath(__file__))

def Signature(_gamename):
	_key=_gamename
	_name=_gamename
	_key = re.sub("[\s+\.\!\/_,$%^*(+\"\']+|[+——！，。？、~@#￥%……&*（）]+", "",_key)
	_key = _key.replace(" ","")
	_name = re.sub("[\s+\.\!\/_,$%^*(+\"\']+|[+——！，。？、~@#￥%……&*（）]+", "",_name)
	_name = _name.replace(" ","")
	_gamename = re.sub("[\s+\.\!\/_,$%^*(+\"\']+|[+——！，。？、~@#￥%……&*（）]+", "",_gamename)
	_gamename = _gamename.replace(" ","")

	#p = Popen(["python3", "/Users/yupengqin/MyPragram/E2WGAME/03_Appurtenance/031_双击打空包.py"], stdout=PIPE, stdin=PIPE, stderr=STDOUT)
	os.system("keytool -genkey -alias android.keystore \
    -keyalg RSA -keystore "+_gamename+".keystore \
	-validity 120000 \
    -dname \"CN="+_key+", OU="+_gamename+", O="+_name+", L=singmaan, S=singmaan, C=China\" \
    -storepass singmaan -keypass singmaan")
if __name__=='__main__':
	game_name = input("input game id:")
	Signature(game_name)