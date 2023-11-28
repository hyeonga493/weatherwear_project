package com.w2.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.admin.notice.NoticeBoardDAO;
import com.w2.admin.notice.NoticeBoardService;
import com.w2.admin.notice.NoticeBoardVO;

import jdk.jfr.Description;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping("/noticeList.mdo")
	@Description("공지사항 목록 페이지로 이동")
	public String getNoticeList(NoticeBoardVO notice, NoticeBoardDAO dao, Model model) {
		
		if(notice.getNoType() == null) notice.setNoType("subject");
		if(notice.getNoKeyword() == null) notice.setNoKeyword("");
		
		model.addAttribute("noticeBoardList", noticeBoardService.getNoticeList(notice));
		System.err.println("model : " + model.toString());
		return "/admin/notice/notice_list";
	}
	
	@GetMapping("/writeNoticeView.mdo")
	@Description("공지사항 글쓰기 페이지로 이동")
	public String writeNoticeView() throws IOException{
		return "/admin/notice/notice_write";
	}
	
	@PostMapping("/writeNotice.mdo")
	@Description("공지사항 글 등록")
	public String writeNotice(NoticeBoardVO notice) throws IOException{
		System.out.println("notice : " + notice);
		
		//공지사항 글번호 랜덤 생성
		String NoticeIdName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMDDHHss");
		Calendar calendar = Calendar.getInstance();
		NoticeIdName = "NO"+simpleDateFormat.format(calendar.getTime());
		NoticeIdName += "_" ;
		// 중복 방지
		for(int i=0; i<10; i++) {
			NoticeIdName += (char)((Math.random()*26)+97);
		}
		
		System.out.println("NoticeFileName : " + NoticeIdName);
		notice.setNoId(NoticeIdName);
		
		System.err.println("===============notice Id 넣은 후 notice vo값 : " + notice);
		noticeBoardService.writeNotice(notice);
		return "redirect: noticeList.mdo?gubun=notice";
	}
	
	@RequestMapping("/noticeDetail.mdo")
	@Description("공지사항 글 상세보기 수정 페이지로 이동")
	public String noticeDetail(NoticeBoardVO notice, NoticeBoardDAO dao, Model model) {
		model.addAttribute("notice", noticeBoardService.noticeDetail(notice));
		return "/admin/notice/notice_detail";
	}
	
	@RequestMapping("/updateNoticeBoard.mdo")
	@Description("공지사항 글 상세보기 수정")
	public String updateNoticeBoard(@ModelAttribute("notice") NoticeBoardVO notice, NoticeBoardDAO dao) {
		
		System.out.println(notice.toString());
		
		noticeBoardService.updateNoticeBoard(notice);
		
		return "redirect:noticeList.mdo?gubun=notice";
	}
	
	@RequestMapping("/deleteNoticeBoard.mdo")
	@Description("공지사항 글 상세보기 삭제")
	public String deleteNoticeBoard(NoticeBoardVO notice, NoticeBoardDAO dao) {
		
		noticeBoardService.deleteNoticeBoard(notice);
		return "redirect:noticeList.mdo?gubun=notice";
	}
	
}
