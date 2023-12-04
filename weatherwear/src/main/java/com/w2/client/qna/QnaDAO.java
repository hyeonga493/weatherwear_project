package com.w2.client.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<QnaVO> getQnaList(QnaVO clientQna){
		return sqlSessionTemplate.selectList("QnaDAO.getQnaList", clientQna);
	}
	
	public List<QnaVO> getQnaMyPageList(QnaVO clientQna){
		return sqlSessionTemplate.selectList("QnaDAO.getQnaMyPageList", clientQna);
	}

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
	
}
