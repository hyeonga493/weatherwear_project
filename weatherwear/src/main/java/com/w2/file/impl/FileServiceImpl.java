package com.w2.file.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.file.FileDAO;
import com.w2.file.FileService;
import com.w2.file.ImageVO;

@Service("fileService")
public class FileServiceImpl implements FileService {
	@Autowired
	private FileDAO filedao;
	 
	@Override
	public int insertImage(ImageVO cmvo) {
		System.out.println("[ Imple ] : insertImage");
		
		int result = filedao.insertImage(cmvo);

		return result;
	}

}
