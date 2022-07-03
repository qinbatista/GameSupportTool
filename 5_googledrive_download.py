from PIL import Image
import os
import sys
def main():
	urllllll = input("input your file id:")#"1M4upIyil6m1m_GIhWXJDJr66uRLfDfgX"
	file_name = input("input your file name:")#"WW1_iOS_2020-03-30a.zip"

	print("wget --load-cookies /tmp/cookies.txt "+ "\"https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id="+urllllll+"' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\\1\\n/p')&id="+urllllll+"\" -O "+file_name+" && rm -rf /tmp/cookies.txt")
if __name__=='__main__':
	main()