package com.w2.client.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<NoticeVO> getNoticeList(NoticeVO clientNotice){
		return sqlSessionTemplate.selectList("NoticeDAO.getNoticeList", clientNotice);
	}

	public void writeNotice(NoticeVO clientNotice) {
		sqlSessionTemplate.insert("NoticeDAO.writeNotice", clientNotice);
	}

	public void updateNoticeBoard(NoticeVO clientNotice) {
		sqlSessionTemplate.update("NoticeDAO.updateNoticeBoard", clientNotice);
	}

	public void deleteNoticeBoard(NoticeVO clientNotice) {
		sqlSessionTemplate.delete("NoticeDAO.deleteNoticeBoard", clientNotice);		
	}
	
	public NoticeVO noticeDetail(NoticeVO clientNotice) {
		return sqlSessionTemplate.selectOne("NoticeDAO.noticeDetail", clientNotice);
	}
	
}
