package com.w2.admin.notice.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.admin.notice.NoticeBoardDAO;
import com.w2.admin.notice.NoticeBoardService;
import com.w2.admin.notice.NoticeBoardVO;

@Service("noticeBoardService") 
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDAO dao;

	@Override
	public void writeNotice(NoticeBoardVO notice) {
		dao.writeNotice(notice);
	}

	@Override
	public void updateNoticeBoard(NoticeBoardVO notice) {
		dao.updateNoticeBoard(notice);
	}

	@Override
	public void deleteNoticeBoard(NoticeBoardVO notice) {
		dao.deleteNoticeBoard(notice);
	}

	@Override
	public NoticeBoardVO noticeDetail(NoticeBoardVO notice) {
		return dao.noticeDetail(notice);
	}

	@Override
	public List<NoticeBoardVO> getNoticeList(NoticeBoardVO notice) {
		return dao.noticeBoardList(notice);
	}

}
