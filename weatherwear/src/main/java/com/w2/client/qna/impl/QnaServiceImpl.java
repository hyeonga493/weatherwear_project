package com.w2.client.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.client.qna.QnaDAO;
import com.w2.client.qna.QnaService;
import com.w2.client.qna.QnaVO;

@Service("qnaService") 
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO dao;
	
	@Override
	public List<QnaVO> getQnaList(QnaVO clientQna) {
		return dao.getQnaList(clientQna);
	}

	@Override
	public List<QnaVO> getQnaMyPageList(QnaVO clientQna) {
		return dao.getQnaMyPageList(clientQna);
	}
	
	@Override
	public void writeQna(QnaVO clientQna) {
		dao.writeQna(clientQna);
	}

	@Override
	public void updateQna(QnaVO clientQna) {
		dao.updateQna(clientQna);
	}

	@Override
	public void deleteQna(QnaVO clientQna) {
		dao.deleteQna(clientQna);
	}

	@Override
	public QnaVO qnaDetail(QnaVO clientQna) {
		System.err.println(">>>>> clientQna : " + clientQna.toString());
		
		QnaVO result = dao.qnaDetail(clientQna);
		
		System.err.println("____________ result : " + result);
		
		return result;
	}

	@Override
	public QnaVO qnaMyPageDetail(QnaVO clientQna) {
		System.err.println(">>>>> clientQna : " + clientQna.toString());
		
		QnaVO result = dao.qnaDetail(clientQna);
		
		System.err.println("____________ result : " + result);
		
		return result;
	}
	
}
