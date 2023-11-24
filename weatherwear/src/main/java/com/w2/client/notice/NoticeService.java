package com.w2.client.notice;

import java.util.List;

public interface NoticeService {

	List<NoticeVO> getNoticeList(NoticeVO clientNotice);

	NoticeVO noticeDetail(NoticeVO clientNotice);

	void writeNotice(NoticeVO clientNotice);

	void updateNoticeBoard(NoticeVO clientNotice);

	void deleteNoticeBoard(NoticeVO clientNotice);

}
