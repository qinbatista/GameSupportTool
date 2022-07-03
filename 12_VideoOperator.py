#You must have ffmpeg install
import os
import sys
class VideoOperator:
	def __init__(self, _file):
		self.__ID_extract_aac = 1
		self.__ID_extract_split_aac = 2
		self.__ID_cover_stereo_to_mono = 3
		self.__ID_merge_mono_aac_to_video = 4
		self.__ID_create_right_left_to_video = 5
		self.__ID_strink_1st_second = 6
		self.__ID_zip_video = 7
		self.__ID_convert_to_mp4 = 8
		self.__ID_convert_to_mp3= 9
		self.__file = _file
		self.__option = 0
		self.__file_path = ""
		self.__file_name_with_extension = ""
		self.__file_name_without_extension = ""
		self.__file_extension_name = ""
		self.__navigate_folder()
		self.__cache_list = []

	def _operator(self, option):
		# print("aa="+option)
		# print("self.__ID_convert_to_mp3="+self.__ID_convert_to_mp3)
		option = int(option)
		if option == self.__ID_extract_aac:
			self.__extract_aac()
		elif option == self.__ID_extract_split_aac:
			self.__split_aac()
		elif option == self.__ID_cover_stereo_to_mono:
			self.__cover_stereo_to_mono()
		elif option == self.__ID_merge_mono_aac_to_video:
			self.__merge_mono_aac_to_video()
		elif option == self.__ID_create_right_left_to_video:
			self._create_right_left_to_video()
		elif option == self.__ID_strink_1st_second:
			self.__strink_1st_second()
		elif option == self.__ID_zip_video:
			self.__zip_video()
		elif option == self.__ID_convert_to_mp4:
			self.__convert_to_mp4()
		elif option == self.__ID_convert_to_mp3:
			self.__convert_to_mp3()
			
	def __navigate_folder(self):
		self.__file_path, self.__file_name_with_extension = os.path.split(os.path.abspath(self.__file))
		self.__file_name_without_extension, self.__file_extension_name = self.__file_name_with_extension.split(".")
		os.chdir(self.__file_path)

	def __extract_aac(self):
		file_path = f"{self.__file_name_without_extension}.aac"
		if os.path.exists(file_path):
			os.remove(file_path)
		os.system(f"ffmpeg -y -i {self.__file} -acodec copy -vn {file_path}")
		self.__cache_list.append(file_path)

	def __split_aac(self):
		if os.path.exists(f"{self.__file_name_without_extension}.aac")==False:
			self.__extract_aac()
		left = self.__file_name_without_extension+"_left.aac"
		right = self.__file_name_without_extension+"_right.aac"
		os.system(f"ffmpeg -y -i {self.__file_name_without_extension}.aac -map_channel 0.0.0 {left} -map_channel 0.0.1 {right}")

	def __cover_stereo_to_mono(self):
		if os.path.exists(f"{self.__file_name_without_extension}.aac")==False:
			self.__extract_aac()
		os.system(f"ffmpeg -y -i {self.__file_name_without_extension}.aac -ac 1 {self.__file_name_without_extension}_mono.aac")
		self.__cache_list.append(f"{self.__file_name_without_extension}_mono.aac")

	def __strink_1st_second(self):
		os.system(f"ffmpeg -i {self.__file} -ss  0.1 -map 0  -c copy {self.__file_name_without_extension}_strinked."+self.__file_extension_name)  

	def __zip_video(self):
		os.system(f"ffmpeg -i {self.__file} -max_muxing_queue_size 9999 -vcodec h264 -acodec mp2 {self.__file_name_without_extension}_ziped.{self.__file_extension_name}")  

	def __convert_to_mp4(self):
		os.system(f"ffmpeg -i {self.__file}  -max_muxing_queue_size 9999 {self.__file_name_without_extension}.mp4")  
	
	def __convert_to_mp3(self):
		print("9")
		os.system(f"ffmpeg -i {self.__file}  -q:a 0 -map a {self.__file_name_without_extension}.mp3")  

	def __merge_mono_aac_to_video(self):
		if os.path.exists(f"{self.__file_name_without_extension}_mono.aac")==False:
			self.__cover_stereo_to_mono()
		os.system(f"ffmpeg -y -i {self.__file} -i {self.__file_name_without_extension}_mono.aac -c:v copy -map 0:v:0 -map 1:a:0 {self.__file_name_without_extension}_stereo.mp4")

	def _create_right_left_to_video(self):
		if os.path.exists(f"{self.__file_name_without_extension}_left.aac")==False:
			self.__split_aac()
		os.system(f"ffmpeg -y -i {self.__file} -i {self.__file_name_without_extension}_left.aac -c:v copy -map 0:v:0 -map 1:a:0 {self.__file_name_without_extension}_left.mp4")
		os.system(f"ffmpeg -y -i {self.__file} -i {self.__file_name_without_extension}_right.aac -c:v copy -map 0:v:0 -map 1:a:0 {self.__file_name_without_extension}_right.mp4")
		self.__cache_list.append(f"{self.__file_name_without_extension}_left.aac")
		self.__cache_list.append(f"{self.__file_name_without_extension}_right.aac")
		self.__cache_list.append(f"{self.__file_name_without_extension}.aac")

	def _clean_cache(self):
		for file_name in self.__cache_list:
			if os.path.exists(file_name):os.remove(file_name)




if __name__ == '__main__':
	# gm = VideoOperator("/Users/batista/Desktop/丢架.mp4","1")
	print("str(len(sys.argv))="+str(len(sys.argv)))
	print("str(sys.argv)="+str(sys.argv))
	if len(sys.argv)<3:
		print("no correct parameter")
	else:
		gm = VideoOperator(sys.argv[1])
		gm._operator(sys.argv[2])
	# if len(sys.argv)<=3:
	# 	print("3:"+sys.argv[1])
	# 	print("3:"+sys.argv[2])
	# 	gm = VideoOperator(sys.argv[1])
	# 	gm._operator(sys.argv[2])
	# if len(sys.argv)<=4:
	# 	print("4:"+sys.argv[1])
	# 	print("4:"+sys.argv[2])
	# 	gm = VideoOperator(sys.argv[1])
	# 	gm._operator(int(sys.argv[2]))
	# 	gm._clean_cache()


