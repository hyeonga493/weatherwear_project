package com.w2.client.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.w2.admin.qna.QnaBoardVO;


@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void writeQna(QnaVO clientQna) {
		sqlSessionTemplate.insert("QnaDAO.writeQna", clientQna);
	}

	public void updateQna(QnaVO clientQna) {
		sqlSessionTemplate.update("QnaDAO.updateQna", clientQna);
	}

	public void deleteQna(QnaVO clientQna) {
		sqlSessionTemplate.delete("QnaDAO.deleteQna", clientQna);		
	}
	
	public QnaVO qnaDetail(QnaVO clientQna) {

		System.err.println("@@@@@ clientQna : " + clientQna.toString());
		
		QnaVO result = sqlSessionTemplate.selectOne("QnaDAO.qnaDetail", clientQna);
		System.err.println("@@@@@ result : " + result);
		return result;
	}
	
	public QnaVO qnaMyPageDetail(QnaVO clientQna) {

		System.err.println("@@@@@ clientQna : " + clientQna.toString());
		
		QnaVO result = sqlSessionTemplate.selectOne("QnaDAO.qnaDetail", clientQna);
		System.err.println("@@@@@ result : " + result);
		return result;
	}
	
	public int searchCount(QnaVO clientQna) {
		System.out.println("[ QnaDAO ] : searchCount");
		return sqlSessionTemplate.selectOne("QnaDAO.getQnaCount", clientQna);
	}

	public List<QnaVO> getQnaMyPageList(QnaVO clientQna) {
		System.out.println("[ qnaDAO ] : getQnaMyPageList");
		return sqlSessionTemplate.selectList("QnaDAO.getQnaMyPageList", clientQna); 
	}
	
	public int clientSearchCount(QnaVO clientQna) {
		System.out.println("[ QnaDAO ] : clientSearchCount");
		return sqlSessionTemplate.selectOne("QnaDAO.getClientQnaCount", clientQna);
	}

	public List<QnaVO> qnaList(QnaVO clientQna) {
		System.out.println("[ qnaDAO ] : getQnaList");
		return sqlSessionTemplate.selectList("QnaDAO.getQnaList", clientQna); 
	}
	
	
}
