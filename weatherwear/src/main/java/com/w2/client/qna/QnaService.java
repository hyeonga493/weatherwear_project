package com.w2.client.qna;

import java.util.List;

public interface QnaService {
	List<QnaVO> getQnaList(QnaVO clientQna);

	List<QnaVO> getQnaMyPageList(QnaVO clientQna);
	
	QnaVO qnaMyPageDetail(QnaVO clientQna);
	
	QnaVO qnaDetail(QnaVO clientQna);

	void writeQna(QnaVO clientQna);

	void updateQna(QnaVO clientQna);

	void deleteQna(QnaVO clientQna);
}
