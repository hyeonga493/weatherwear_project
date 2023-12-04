package com.w2.admin.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<NoticeBoardVO> getNoticeList(NoticeBoardVO notice){
		return sqlSessionTemplate.selectList("NoticeBoardDAO.getNoticeList", notice);
	}

	public void writeNotice(NoticeBoardVO notice) {
		sqlSessionTemplate.insert("NoticeBoardDAO.writeNotice", notice);
	}

	public void updateNoticeBoard(NoticeBoardVO notice) {
		sqlSessionTemplate.update("NoticeBoardDAO.updateNoticeBoard", notice);
	}

	public void deleteNoticeBoard(NoticeBoardVO notice) {
		sqlSessionTemplate.delete("NoticeBoardDAO.deleteNoticeBoard", notice);		
	}
	
	public NoticeBoardVO noticeDetail(NoticeBoardVO notice) {
		return sqlSessionTemplate.selectOne("NoticeBoardDAO.noticeDetail", notice);
	}
	
}
