package com.w2.client.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping("/writeQnaView.do")
	@Description("공지사항 글쓰기 페이지로 이동")
	public String writeQnaView() throws IOException{
		return "/client/qna/qna_write";
	}
	
	@PostMapping("/writeQna.do")
	@Description("공지사항 글 등록")
	public String writeQna(QnaVO clientQna) throws IOException{
		
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
	
	@RequestMapping("/updateQna.do")
	@Description("공지사항 글 상세보기 수정")
	public String updateNoticeBoard(@ModelAttribute("clientQna") QnaVO clientQna, QnaDAO dao) {
		
		System.out.println(clientQna.toString());
		
		qnaService.updateQna(clientQna);
		
		return "redirect:clientQnaList.do";
	}
	
	@RequestMapping("/deleteQna.do")
	@Description("문의사항 글 상세보기 삭제")
	public String deleteQna(QnaVO clientQna, QnaDAO dao) {
		
		qnaService.deleteQna(clientQna);
		return "redirect:clientQnaList.do";
	}
	
}
