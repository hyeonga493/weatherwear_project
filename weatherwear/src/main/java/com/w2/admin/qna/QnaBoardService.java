package com.w2.admin.qna;

import java.util.List;

public interface QnaBoardService {

	QnaBoardVO qnaDetail(QnaBoardVO qna);

	void updateQnaBoard(QnaBoardVO qna);
}
