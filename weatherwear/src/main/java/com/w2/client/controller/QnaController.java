package com.w2.client.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.w2.client.qna.QnaDAO;
import com.w2.client.qna.QnaService;
import com.w2.client.qna.QnaVO;

import jdk.jfr.Description;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@RequestMapping("/clientQnaList.do")
	@Description("문의사항 목록 페이지로 이동")
	public String getQnaList(QnaVO clientQna, QnaDAO dao, Model model) {
		
		if(clientQna.getQnaSelectType() == null) clientQna.setQnaSelectType("subject");
		if(clientQna.getQnaKeyword() == null) clientQna.setQnaKeyword("");
		
		model.addAttribute("qnaBoardList", qnaService.getQnaList(clientQna));
		System.err.println("qnaList model : " + model.toString());
		return "/client/qna/qna_list";
	}
	
	@RequestMapping("/clientQnaMyPageList.do")
	@Description("마이페이지 문의사항 목록 페이지로 이동")
	public String getQnaMyPageList(QnaVO clientQna, Model model, HttpSession session) {
		clientQna.setClientId((String)session.getAttribute("clientId"));
		System.err.println("clientQna : " + clientQna.toString());
		
		if(clientQna.getQnaSelectType() == null) {
			clientQna.setQnaSelectType("subject");
		}
		
		if(clientQna.getQnaKeyword() == null) {
			clientQna.setQnaKeyword("");
		}
		
		model.addAttribute("qnaBoardMyPageList", qnaService.getQnaMyPageList(clientQna));
		System.err.println("qnaBoardMyPageList model : " + model.toString());

		return "/client/qna/qna_myPageList";
	}
	
	@GetMapping("/writeQnaView.do")
	@Description("문의사항 글쓰기 페이지로 이동")
	public String writeQnaView() throws IOException{
		return "/client/qna/qna_write";
	}
	
	@PostMapping("/writeQna.do")
	@Description("문의사항 글 등록")
	public String writeQna(QnaVO clientQna) throws IOException{
		
		//문의사항 글번호 랜덤 생성
		String QnaIdName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMDDHHss");
		Calendar calendar = Calendar.getInstance();
		QnaIdName = "Q"+simpleDateFormat.format(calendar.getTime());
		QnaIdName += "_" ;
		// 중복 방지
		for(int i=0; i<10; i++) {
			QnaIdName += (char)((Math.random()*26)+97);
		}
		
		System.out.println("QnaIdName : " + QnaIdName);
		clientQna.setQnaId(QnaIdName);
		
		qnaService.writeQna(clientQna);
		return "redirect: clientQnaList.do";
	}
	
	@RequestMapping("/qnaDetail.do")
	@Description("문의사항 글 상세보기 수정 페이지로 이동")
	public String qnaDetail(QnaVO clientQna, QnaDAO dao, Model model) {
		System.err.println("clientQna : " + clientQna.toString());
		
		QnaVO result = qnaService.qnaDetail(clientQna);
		System.err.println("result : " + result.toString());
		
		model.addAttribute("clientQna", result);
		System.err.println("qnaDetail model : " + model.toString());
		return "/client/qna/qna_detail";
	}
	
	@RequestMapping("/qnaMyPageDetail.do")
	@Description("문의사항 글 상세보기 수정 페이지로 이동")
	public String qnaMyPageDetail(QnaVO clientQna, QnaDAO dao, Model model) {
		System.err.println("clientQna : " + clientQna.toString());
		
		QnaVO result = qnaService.qnaDetail(clientQna);
		System.err.println("result : " + result.toString());
		
		model.addAttribute("clientQna", result);
		System.err.println("qnaDetail model : " + model.toString());
		return "/client/qna/qna_myPageDetail";
	}
	
	@RequestMapping("/updateQna.do")
	@Description("문의사항 글 상세보기 수정")
	public String updateQna(@ModelAttribute("clientQna") QnaVO clientQna, QnaDAO dao) {
		
		System.out.println(clientQna.toString());
		
		qnaService.updateQna(clientQna);
		
		return "redirect: clientQnaMyPageList.do";
	}
	
	@RequestMapping("/updateMyPageQna.do")
	@Description("마이페이지 문의사항 글 상세보기 수정")
	public String updateMyPageQna(@ModelAttribute("clientQna") QnaVO clientQna, QnaDAO dao) {
		
		qnaService.updateQna(clientQna);
		
		return "redirect:clientQnaMyPageList.do";
	}
	
	@RequestMapping("/deleteQna.do")
	@Description("문의사항 글 상세보기 삭제")
	public String deleteQna(QnaVO clientQna, QnaDAO dao) {
		
		qnaService.deleteQna(clientQna);
		return "redirect:clientQnaList.do";
	}
	
	@RequestMapping("/deleteMyPageQna.do")
	@Description("마이페이지 문의사항 글 상세보기 삭제")
	public String deleteMyPageQna(HttpServletRequest request, QnaVO clientQna) {
		System.err.println("삭제중");
		
		qnaService.deleteQna(clientQna);
		
		return "redirect:clientQnaMyPageList.do";
	}
	
}
