package com.w2.client.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.client.notice.NoticeDAO;
import com.w2.client.notice.NoticeService;
import com.w2.client.notice.NoticeVO;

@Service("noticeService") 
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO clientNotice) {
		return dao.getNoticeList(clientNotice);
	}

	@Override
	public void writeNotice(NoticeVO clientNotice) {
		dao.writeNotice(clientNotice);
	}

	@Override
	public void updateNoticeBoard(NoticeVO clientNotice) {
		dao.updateNoticeBoard(clientNotice);
	}

	@Override
	public void deleteNoticeBoard(NoticeVO clientNotice) {
		dao.deleteNoticeBoard(clientNotice);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO clientNotice) {
		return dao.noticeDetail(clientNotice);
	}

}
