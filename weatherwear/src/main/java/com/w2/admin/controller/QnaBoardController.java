package com.w2.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.w2.admin.notice.NoticeBoardDAO;
import com.w2.admin.notice.NoticeBoardVO;
import com.w2.admin.qna.QnaBoardDAO;
import com.w2.admin.qna.QnaBoardService;
import com.w2.admin.qna.QnaBoardVO;

import jdk.jfr.Description;

@Controller
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping("/qnaList.mdo")
	@Description("문의사항 목록 페이지로 이동")
	public String getQnaList(QnaBoardVO qna, QnaBoardDAO dao, Model model) {
		
		if(qna.getQnaSelectType() == null) qna.setQnaSelectType("subject");
		if(qna.getQnaKeyword() == null) qna.setQnaKeyword("");
		
		model.addAttribute("qnaBoardList", qnaBoardService.getQnaList(qna));
		System.err.println("qnaList model : " + model.toString());
		return "/admin/qna/qna_list";
	}
	
	@RequestMapping("/qnaDetail.mdo")
	@Description("문의사항 글 상세보기 수정 페이지로 이동")
	public String qnaDetail(QnaBoardVO qna, QnaBoardDAO dao, Model model) {
		System.out.println("qna :" + qna);
		model.addAttribute("qna", qnaBoardService.qnaDetail(qna));
		System.err.println("qnaDetail model : " + model.toString());
		return "/admin/qna/qna_detail";
	}
	
	@RequestMapping("/updateQnaBoard.mdo")
	@Description("공지사항 글 상세보기 수정")
	public String updateNoticeBoard(@ModelAttribute("qna") QnaBoardVO qna, QnaBoardDAO dao) {
		
		System.out.println(qna.toString());
		
		qnaBoardService.updateQnaBoard(qna);
		
		return "redirect:qnaList.mdo";
	}
	
}
