from PIL import Image
import os
import sys
def main(_path):
	file_path = _path[:_path.rfind("/")]
	file_name = os.path.splitext(_path)[0][os.path.splitext(_path)[0].rfind("/")+1:]
	file_format = os.path.splitext(_path)[-1]
	ss = os.path.splitext(_path)
	im = Image.open(_path)
	(x, y) = im.size # 读取图片大小
	size = [20,29,40,58,60,76,80,87,120,152,167,180]
	for new_size in size:
		out = im.resize((new_size, new_size), Image.ANTIALIAS)
		out.save(file_path+'/'+file_name+"_"+str(new_size)+file_format)
if __name__=='__main__':
	# _path = sys.argv[1]
	main(input("input your picture path:"))