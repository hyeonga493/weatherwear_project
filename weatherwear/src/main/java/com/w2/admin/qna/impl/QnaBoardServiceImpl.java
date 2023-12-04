package com.w2.admin.qna.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.admin.qna.QnaBoardDAO;
import com.w2.admin.qna.QnaBoardService;
import com.w2.admin.qna.QnaBoardVO;

@Service("qnaBoardService") 
public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private QnaBoardDAO dao;
	
	@Override
	public List<QnaBoardVO> getQnaList(QnaBoardVO qna) {
		return dao.getQnaList(qna);
	}

	@Override
	public void updateQnaBoard(QnaBoardVO qna) {
		dao.updateQnaBoard(qna);
	}

	@Override
	public QnaBoardVO qnaDetail(QnaBoardVO qna) {
		return dao.qnaDetail(qna);
	}

}
