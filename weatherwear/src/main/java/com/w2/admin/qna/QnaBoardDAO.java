package com.w2.admin.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QnaBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<QnaBoardVO> getQnaList(QnaBoardVO qna){
		return sqlSessionTemplate.selectList("QnaBoardDAO.getQnaList", qna);
	}

	public void updateQnaBoard(QnaBoardVO qna) {
		sqlSessionTemplate.update("QnaBoardDAO.updateQnaBoard", qna);
	}
	
	public QnaBoardVO qnaDetail(QnaBoardVO qna) {
		return sqlSessionTemplate.selectOne("QnaBoardDAO.qnaDetail", qna);
	}

	public List<QnaBoardVO> qnaBoardList(QnaBoardVO qna) {
		System.out.println("[ qnaBoardDAO ] : qnaBoardList");
		return sqlSessionTemplate.selectList("QnaBoardDAO.qnaBoardList", qna); 
	}

	public int searchCount(QnaBoardVO qna) {
		System.out.println("[ NoticeBoardDAO ] : searchCount");
		return sqlSessionTemplate.selectOne("QnaBoardDAO.getQnaBoardCount", qna);
	}

//	public List<QnaBoardVO> getQnaList(QnaBoardVO qna) {
//		return null;
//	}
	
}
