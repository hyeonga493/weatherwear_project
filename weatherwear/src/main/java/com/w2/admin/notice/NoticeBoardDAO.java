package com.w2.admin.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class NoticeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

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
	
	// 공지글 수 조회 
	public int searchCount(NoticeBoardVO notice) {
	System.out.println("[ NoticeBoardDAO ] : searchCount");
	return sqlSessionTemplate.selectOne("NoticeBoardDAO.getNoticeBoardCount", notice); 
	}
	// 공지글 리스트 조회
	public List<NoticeBoardVO> noticeBoardList(NoticeBoardVO notice) { 
	System.out.println("[ noticeBoardDAO ] : noticeBoardList");
	return sqlSessionTemplate.selectList("NoticeBoardDAO.noticeBoardList", notice); 
	}
}
