package com.w2.file;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertImage(ImageVO imvo) {
		System.out.println("[ FileDAO ] : insertImage");
		
		int result = sqlSessionTemplate.insert("ImageVO.insertImage", imvo);
		
		return result;
	}
} 
