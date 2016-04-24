#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import os

# RAW_DATA_PATHΪ����ԭʼ����·��
RAW_DATA_PATH = "D:\\QGrid\\Rawdata\\taxi"

# ��ȡRAW_DATA_PATH�������ļ���
def getAllRawDataFile():
	try:
		fileList = os.listdir(RAW_DATA_PATH)
	except:
		print("Failed to open \"%s\"" % APP_DIR)
		sys.exit(-1)
	return fileList

# ��ÿ�����ݽ��д���
def lineData2File(line):
	try:
		# ��ÿ�����ݰ���,����֣�����data�У����ݸ�ʽ��list��
		data = line.split(",")
		# ��ȡdata[6]��ֵ����Ϊʱ������
		oriTimestamp = data[6]
		# ��ȡ���ں�ʱ�䣬����ʱ��ת��Ϊ��
		oriDate = oriTimestamp.split()[0]
		oriTime = oriTimestamp.split()[1]
		timeList = oriTime.split(":")
		seconds = int(timeList[0])*3600 + int(timeList[1])*60 + int(timeList[2])
		# �������еġ�-��ȥ����������������������д������
		# ���ݰ�������ID�����ȡ�γ�ȡ��ٶȺ�����
		outputFileName = oriDate.replace("-", "")
		outputFilePath = outputFileName + ".txt"
		fp = open(outputFilePath, "a")
		fp.write(data[1] + "," + data[2] + "," + data[3] + "," + data[4] + "," + str(seconds) + ",\n")
		fp.close()
	except:
		print(data)

# ���ζ�ȡRAW_DATA_PATH��ÿ���ļ���������Ҫ������д���Ӧ����Ϊ�ļ������ļ���
def readRawData():
	fileList = getAllRawDataFile()
	for file in fileList:
		filePath = RAW_DATA_PATH + "\\" + file
		fp = open(filePath, "r")
		for line in fp:
			lineData2File(line)
		fp.close()

def main():
	readRawData()
	
if __name__ == '__main__':
	main()
