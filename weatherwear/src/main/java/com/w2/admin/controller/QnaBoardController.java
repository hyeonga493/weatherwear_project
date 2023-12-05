package com.w2.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.w2.admin.qna.QnaBoardDAO;
import com.w2.admin.qna.QnaBoardService;
import com.w2.admin.qna.QnaBoardVO;
import com.w2.paging.PagingService;

import jdk.jfr.Description;

@Controller
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	@Autowired
	private PagingService pagingService;
	
	@RequestMapping("/qnaList.mdo")
	@Description("문의사항 목록 페이지로 이동")
	public String getQnaList(@RequestParam(value="page", required=false)Integer page, QnaBoardVO qna, Model model) {
		
		if(qna.getQnaSelectType() == null) qna.setQnaSelectType("subject");
		if(qna.getQnaKeyword() == null) qna.setQnaKeyword("");
		
		List<QnaBoardVO> qnaBoardList = pagingService.qnaBoardList(page, qna, model);
		model.addAttribute("qnaBoardList", qnaBoardList);
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
