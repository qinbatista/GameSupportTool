import sys, os, platform
import shutil
import xml.etree.ElementTree as ET
class xml_manager(object):
	def __init__(self, path):
		self.path = path
		#从系统加载 xml 文件, getroot () 获取根节点
		self.tree = ET.parse(self.path)
		self.root = self.tree.getroot()
		#为存储配置创建字典
		self.tag = {}
		self.GetAllTag()

	#添加方法
	def AddTag(self, tagName, content, name):
		newEle = ET.Element(tagName, {"name": name})
		newEle.text = content
		newEle.tail="\n"
		self.root.append(newEle)
		self.SaveContext()
	#删除方法
	def DelTag(self, tagName):
		if tagName in self.tag:
			for child in self.root:
				if tagName == child.attrib.get('name'):
					self.root.remove(child)
					return True
		else:
			return False
		self.SaveContext()

    #去重方法
	def DeleteMultiTag_SaveFirstElementPriorities(self):
		tag_h = {}
		tag_x = {}
		for child in self.root:
			tag_x[child.attrib.get('name')] = 0
		for child in self.root:
			if child.attrib.get('name') in tag_h:
				tag_x[child.attrib.get('name')] = int(int(tag_x[child.attrib.get('name')])+1)
			else:
				tag_h[child.attrib.get('name')] = child.text
		for k in tag_x.keys():
			n = int(tag_x[k])
			while n != 0:
				n = n-1
				num = 0
				for ch in self.root:
					if ch.attrib.get('name') ==None:
						continue
					if k == ch.attrib.get('name') and num == 1:
						num = 0
						print("[First Priorities]Mulit Element Delete: "+ch.attrib.get('name'))
						self.root.remove(ch)
					elif k == ch.attrib.get('name'):
						num = 1
		self.tag = tag_h
		self.SaveContext()
	def DeleteMultiTag_SaveLastElementPriorities(self):
		tag_h = {}
		tag_x = {}
		for child in self.root:
			tag_x[child.attrib.get('name')] = 0
		for child in self.root:
			if child.attrib.get('name') in tag_h:
				tag_x[child.attrib.get('name')] = int(int(tag_x[child.attrib.get('name')])+1)
			else:
				tag_h[child.attrib.get('name')] = child.text

		for k in tag_x.keys():
			n = int(tag_x[k])
			while n != 0:
				n = n-1
				print("[First Priorities]Mulit Element Delete: "+ch.attrib.get('name'))
				self.DelTag(k)
		self.tag = tag_h
		self.SaveContext()
	def Merge(self,path2):
		#从系统加载 xml 文件, getroot () 获取根节点
		tree2 = ET.parse(path2)
		root2 = tree2.getroot()
		if self.root.tag == root2.tag:
			for child in root2:
				self.root.append(child)
			self.SaveContext()
		else:
			file_object = open(self.path,encoding="utf8")
			JavaCode=[]
			try:
				all_the_text = file_object.readlines()
				for i in all_the_text:
					JavaCode.append(i)
			finally:
				file_object.close()
			JavaCode.append('\n\n')
			file_object = open(path2,encoding="utf8")
			try:
				all_the_text = file_object.readlines()
				for i in all_the_text:
					JavaCode.append(i)
			finally:
				file_object.close()
			file_object_read = open(self.path,'w',encoding="utf8")
			try:
				file_object_read.writelines(JavaCode)
			finally:
				file_object_read.close()
		print('Merge Success')
	def GetAllTag(self):
		for child in self.root:
			self.tag[child.attrib.get('name')] = child.text

	def isKeyExist(self,tagName:str):
		if tagName in self.tag:
			return True
		else:
			return False

	def SaveContext(self):
		self.tree.write(self.path,encoding="utf-8",xml_declaration=True)
class APKBuildManager():
	def __init__(self,_path):
		self._path = _path
		self._basic_SDK = ""
		self._file_name = os.path.splitext(_path)[0][os.path.splitext(_path)[0].rfind("/")+1:]
		self._file_path = _path[:_path.rfind("/")]

	def _extract_resource(self):
		if os.path.isdir(self._path)==False:
			if os.path.exists(self._file_path+"/"+self._file_name):
				shutil.rmtree(self._file_path+"/"+self._file_name)
			os.mkdir(self._file_path+"/"+self._file_name)
			shutil.move(self._path, self._file_path+"/"+self._file_name)
		self._path = self._file_path+"/"+self._file_name
		file_list = self.__all_files_in_folder(self._path)
		for file_name in file_list:
			if file_name.rfind(".aar")!=-1:
				self.__extract(file_name)

		#make new resource folder
		if os.path.isdir(f"{self._file_path}/{self._file_name}/aar_extract")==True: shutil.rmtree(f"{self._file_path}/{self._file_name}/aar_extract")
		if os.path.isdir(f"{self._file_path}/{self._file_name}/aar_extract")==False:os.mkdir(f"{self._file_path}/{self._file_name}/aar_extract")

		#move assets to new resource folder
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name+"/assets")==True:
					self.__merge_assets(self._file_path+"/"+self._file_name+"/"+folder_name+"/assets", self._file_path+"/"+self._file_name+"/aar_extract/assets")

		#move jniLibs to new resource folder
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name+"/jni")==True:
					self.__merge_jni(self._file_path+"/"+self._file_name+"/"+folder_name+"/jni", self._file_path+"/"+self._file_name+"/aar_extract/jniLibs")

		#move jar to new resource folder
		if os.path.isdir(self._file_path+"/"+self._file_name+"/aar_extract/libs/")==False:os.mkdir(self._file_path+"/"+self._file_name+"/aar_extract/libs/")
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if folder_name.rfind(".jar")!=-1:
				self.__merge_libs(self._file_path+"/"+self._file_name+"/"+folder_name, self._file_path+"/"+self._file_name+"/aar_extract/libs/"+folder_name)
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				self.__merge_libs(self._file_path+"/"+self._file_name+"/"+folder_name+"/"+folder_name+".jar", self._file_path+"/"+self._file_name+"/aar_extract/libs/"+folder_name+".jar")
				if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name+"/libs")==True:
					folder_list = self.__list_folder(self._file_path+"/"+self._file_name+"/"+folder_name+"/libs")
					for f_name in folder_list:
						self.__merge_libs(self._file_path+"/"+self._file_name+"/"+folder_name+"/libs/"+f_name, self._file_path+"/"+self._file_name+"/aar_extract/libs/"+f_name)

		#move res to new resource folder
		if os.path.isdir(self._file_path+"/"+self._file_name+"/aar_extract/res/")==False:os.mkdir(self._file_path+"/"+self._file_name+"/aar_extract/res/")
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name+"/res")==True:
					self.__merge_res(self._file_path+"/"+self._file_name+"/"+folder_name+"/res", self._file_path+"/"+self._file_name+"/aar_extract/res")

		#move xml to new resource folder
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				if os.path.isfile(self._file_path+"/"+self._file_name+"/"+folder_name+"/AndroidManifest.xml"):
					self.__merge_xml(self._file_path+"/"+self._file_name+"/"+folder_name+"/AndroidManifest.xml", self._file_path+"/"+self._file_name+"/aar_extract/AndroidManifest.xml")
			# 	self.__merge_libs(self._file_path+"/"+self._file_name+"/"+folder_name, self._file_path+"/"+self._file_name+"/aar_extract/libs/"+folder_name)
			# if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
			# 	self.__merge_libs(self._file_path+"/"+self._file_name+"/"+folder_name+"/"+folder_name+".jar", self._file_path+"/"+self._file_name+"/aar_extract/libs/"+folder_name+".jar")
		folder_list = self.__list_folder(self._path)
		for folder_name in folder_list:
			if os.path.isdir(self._file_path+"/"+self._file_name+"/"+folder_name)==True and folder_name.rfind("aar_extract")==-1:
				shutil.rmtree(self._file_path+"/"+self._file_name+"/"+folder_name)
	def __merge_assets(self, _source, _des):
		self.__copyFileCounts = 0
		if os.path.isdir(_des)==False:os.mkdir(_des)
		self._copy_files_overwrite(_source,_des)

	def __merge_jni(self, _source, _des):
		self.__copyFileCounts = 0
		if os.path.isdir(_des)==False:os.mkdir(_des)
		self._copy_files_overwrite(_source,_des)

	def __merge_libs(self, _source, _des):
		shutil.copy(_source,_des)

	def __merge_res(self, _source, _des):
		self.__copyFileCounts = 0
		jar_res = self.__all_files_in_folder(_source)
		apk_res  = self.__all_files_in_folder(_des)
		self._copy_files_dont_overwrite(_source,_des)
		for g_res in jar_res:
			for s_res in apk_res:
				gameresfile = g_res[g_res.rfind("/"):]
				sdkresfile = s_res[s_res.rfind("/"):]
				if sdkresfile == gameresfile and ".xml" in sdkresfile:
					if gameresfile == "/activity_main.xml" or gameresfile == "/main.xml":
						print(f"skip{gameresfile}")
						continue
					else:
						print(f"[_decompile_sdk_apk][__merge_sdk_resource][__merge_sdk_resource_xml]merging {g_res}<-{s_res}")
						merge_xml(s_res,g_res)

	def __merge_xml(self, _source, _des):
		#get application_xml
		application_xml = []
		with open(_source,encoding="utf8") as file_object:
			is_sdk_part = False
			is_start_insert = False
			all_the_text = file_object.readlines()
			for i in all_the_text:
				f = i.replace(" ","")
				if is_start_insert==False:
					if f.find("<application")!=-1 and is_sdk_part == False:
						is_sdk_part = True
					if is_sdk_part == True and f.find(">")==-1:
						continue
					elif is_sdk_part == True and f.find(">")!=-1:
						is_start_insert = True
				else:
					if f.find("</application")==-1:
						application_xml.append(i)
					else:
						# application_xml.append("<!--end-->\r")
						is_sdk_part = False
						break
		#get permission_xml
		permission_xml = []
		with open(_source,encoding="utf8") as file_object:
			is_sdk_part = False
			all_the_text = file_object.readlines()
			for i in all_the_text:
				if i.find("<uses-permission")!=-1:
					permission_xml.append(i)

		new_xml = []
		#merge application xml string into APK
		if not os.path.exists(_des):
			with open(_des,"w",encoding="utf8"):pass
		else:
			with open(_des,"r",encoding="utf8") as file_object:
				new_xml = file_object.readlines()

		with open(_des,"r",encoding="utf8") as file_object:
			all_the_text = file_object.readlines()
			if len(all_the_text) != 0:
				for index, i in enumerate(all_the_text):
					if index==0:
						for application_line in application_xml:
							new_xml.append(application_line)
			else:
				for application_line in application_xml:
					new_xml.append(application_line)


		# #merge permission_xml_line xml string into APK
		# with open(_des,"r",encoding="utf8") as file_object:
		# 	all_the_text = file_object.readlines()
		# 	if len(all_the_text) != 0:
		# 		for index, i in enumerate(all_the_text):
		# 			f = i.replace(" ","")
		# 			if index==len(all_the_text)-1:
		# 				for permission_xml_line in permission_xml:
		# 					new_xml.append(permission_xml_line)
		# 	else:
		# 		for permission_xml_line in permission_xml:
		# 			new_xml.append(permission_xml_line)

		with open(_des,mode='w',encoding="utf8") as file_context:
			file_context.writelines(new_xml)
		pass
	def _copy_files_overwrite(self,sourceDir, targetDir):
		self.__copyFileCounts
		#print (sourceDir)
		#print (u"%s 当前处理文件夹%s已处理%s 个文件" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), sourceDir,copyFileCounts))
		for f in os.listdir(sourceDir):
			sourceF = os.path.join(sourceDir, f)
			targetF = os.path.join(targetDir, f)
			if os.path.isfile(sourceF):
				#创建目录
				if not os.path.exists(targetDir):
					os.makedirs(targetDir)
				self.__copyFileCounts += 1
				#文件不存在，或者存在但是大小不同，覆盖
				if not os.path.exists(targetF):
					#2进制文件
					open(targetF, "wb").write(open(sourceF, "rb").read())
					#print (u"%s %s 复制完毕" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), targetF))
				else:
					open(targetF, "wb").write(open(sourceF, "rb").read())
					# print (u"%s %s 已存在，覆盖拷贝" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), targetF))
			if os.path.isdir(sourceF):
				self._copy_files_overwrite(sourceF, targetF)

	def _copy_files_dont_overwrite(self,sourceDir, targetDir):
		self.__copyFileCounts
		#print (sourceDir)
		#print (u"%s 当前处理文件夹%s已处理%s 个文件" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), sourceDir,copyFileCounts))
		for f in os.listdir(sourceDir):
			sourceF = os.path.join(sourceDir, f)
			targetF = os.path.join(targetDir, f)
			if os.path.isfile(sourceF):
				#创建目录
				if not os.path.exists(targetDir):
					os.makedirs(targetDir)
				self.__copyFileCounts += 1
				#文件不存在，或者存在但是大小不同，覆盖
				if not os.path.exists(targetF):
					#2进制文件
					open(targetF, "wb").write(open(sourceF, "rb").read())
					#print (u"%s %s 复制完毕" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), targetF))
				else:
					pass
					# print (u"%s %s 已存在，不重复复制" %(time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time())), targetF))
			if os.path.isdir(sourceF):
				self._copy_files_dont_overwrite(sourceF, targetF)

	def __all_files_in_folder(self,_path):
		ListMyFolder = []
		for dirpath, dirnames, filenames in os.walk(_path):
			for filename in filenames:
				ListMyFolder.append(dirpath+"/"+filename)
		return ListMyFolder

	def	__list_folder(self, _path):
		List = []
		for i in os.listdir(_path):
			List.append(i)
		return List

	def __extract(self, _aar_path):
		CheckString = _aar_path
		# CheckString = sys.argv[1]
		file_name = os.path.splitext(CheckString)[0][os.path.splitext(CheckString)[0].rfind("/")+1:]
		file_path = CheckString[:CheckString.rfind("/")]
		if os.path.exists(file_path+"/"+file_name) and file_name!='':shutil.rmtree(file_path+"/"+file_name)
		if os.path.exists(file_path+"/"+file_name+"_extract") and file_name!='':shutil.rmtree(file_path+"/"+file_name+"_extract")
		os.system(f"unzip {CheckString} -d {file_path}/{file_name}")
		if os.path.isdir(f"{file_path}/{file_name}_extract")==False:os.mkdir(f"{file_path}/{file_name}_extract")
		#复制xml
		if os.path.isfile(file_path+"/"+file_name+"/AndroidManifest.xml"):shutil.copy(file_path+"/"+file_name+"/AndroidManifest.xml", file_path+"/"+file_name+"_extract/AndroidManifest.xml")
		#复制jar
		if os.path.isfile(file_path+"/"+file_name+"/classes.jar"):shutil.copy(file_path+"/"+file_name+"/classes.jar", file_path+"/"+file_name+"_extract/"+file_name+".jar")
		# #拷贝jni
		if os.path.isdir(file_path+"/"+file_name+"/jni"):
			shutil.copytree(file_path+"/"+file_name+"/jni", file_path+"/"+file_name+"_extract/jni")
		# #拷贝aar里的libs
		if os.path.isdir(file_path+"/"+file_name+"/libs"):
			folder_list = self.__list_folder(file_path+"/"+file_name+"/libs")
			for jar in folder_list:
				if os.path.isdir(file_path+"/"+file_name+"_extract/libs/")==False:os.mkdir(file_path+"/"+file_name+"_extract/libs/")
				shutil.copy(file_path+"/"+file_name+"/libs/"+jar, file_path+"/"+file_name+"_extract/libs/"+jar.replace(".jar","")+"_"+file_name+".jar")

		#复制assets
		if os.path.isdir(file_path+"/"+file_name+"/assets"):shutil.copytree(file_path+"/"+file_name+"/assets", file_path+"/"+file_name+"_extract/assets")
		#处置res
		if os.path.isdir(file_path+"/"+file_name+"/res"):shutil.copytree(file_path+"/"+file_name+"/res", file_path+"/"+file_name+"_extract/res")
		#处理jni
		# if os.path.isdir(file_path+"/"+file_name+"/jni"):shutil.copytree(file_path+"/"+file_name+"/jni", file_path+"/"+file_name+"_extract/jniLibs")
		#删除解压文件夹
		if os.path.exists(file_path+"/"+file_name) and file_name!='':shutil.rmtree(file_path+"/"+file_name)
		#移动到解压文件夹位置
		shutil.copytree( file_path+"/"+file_name+"_extract", file_path+"/"+file_name)
		#删除原文件夹
		if os.path.exists(file_path+"/"+file_name+"_extract"):shutil.rmtree(file_path+"/"+file_name+"_extract")

def merge_xml(_Path1,_Path2):
	XMLop = xml_manager(_Path1)
	XMLop.Merge(_Path2)
	XMLop.DeleteMultiTag_SaveFirstElementPriorities()

def main():
	sam = APKBuildManager(sys.argv[1])
	# sam = APKBuildManager("/Users/batista/Desktop/tt_open_ad_sdk3103.aar")
	sam._extract_resource()

if __name__ == '__main__':
	main()