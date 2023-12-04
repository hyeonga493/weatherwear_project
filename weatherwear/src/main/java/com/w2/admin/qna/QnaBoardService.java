package com.w2.admin.qna;

import java.util.List;

public interface QnaBoardService {
	List<QnaBoardVO> getQnaList(QnaBoardVO qna);

	QnaBoardVO qnaDetail(QnaBoardVO qna);

	void updateQnaBoard(QnaBoardVO qna);
}
