package com.w2.admin.notice;

import java.util.List;

public interface NoticeBoardService {

	List<NoticeBoardVO> getNoticeList(NoticeBoardVO notice);

	NoticeBoardVO noticeDetail(NoticeBoardVO notice);

	void writeNotice(NoticeBoardVO notice);

	void updateNoticeBoard(NoticeBoardVO notice);

	void deleteNoticeBoard(NoticeBoardVO notice);

}
