package com.w2.client.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.client.notice.NoticeDAO;
import com.w2.client.notice.NoticeService;
import com.w2.client.notice.NoticeVO;

import jdk.jfr.Description;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 게시판 요청
	@RequestMapping("/clientNotice.do")
	@Description("사용자페이지 공지사항 목록 페이지로 이동")
	public String clientNotice(NoticeVO clientNotice, NoticeDAO dao, Model model) {
		if(clientNotice.getNoType() == null) clientNotice.setNoType("subject");
		if(clientNotice.getNoKeyword() == null) clientNotice.setNoKeyword("");
		
		model.addAttribute("noticeBoardList", noticeService.getNoticeList(clientNotice));
		System.err.println("model : " + model.toString());
		return "client/notice/notice_list";
	}
	
	@RequestMapping("/noticeDetail.do")
	@Description("공지사항 글 상세보기 수정 페이지로 이동")
	public String noticeDetail(NoticeVO clientNotice, NoticeDAO dao, Model model) {
		
		model.addAttribute("clientNotice", noticeService.noticeDetail(clientNotice));
		System.err.println("clientNotice : " + clientNotice);
		return "/client/notice/notice_detail";
	}
	
}
