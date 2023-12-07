package com.w2.admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.w2.admin.notice.NoticeBoardDAO;
import com.w2.admin.notice.NoticeBoardService;
import com.w2.admin.notice.NoticeBoardVO;
import com.w2.file.ImageVO;
import com.w2.file.controller.FileController;
import com.w2.paging.PagingService;

import jdk.jfr.Description;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeBoardService;
	@Autowired
	private PagingService pagingService;
	@Autowired
	private FileController fileController;
	
	@RequestMapping("/noticeList.mdo")
	@Description("공지사항 목록 페이지로 이동")
	public String getNoticeList(@RequestParam(value="page", required=false)Integer page, NoticeBoardVO notice, Model model) {
		
		if(notice.getNoType() == null) notice.setNoType("subject");
		if(notice.getNoKeyword() == null) notice.setNoKeyword("");
		
		List<NoticeBoardVO> NoticeBoardList = pagingService.NoticeBoardList(page, notice, model);
		model.addAttribute("noticeBoardList", NoticeBoardList);
		//System.err.println("model : " + model.toString());
		return "/admin/notice/notice_list";
	}
	
	@GetMapping("/writeNoticeView.mdo")
	@Description("공지사항 글쓰기 페이지로 이동")
	public String writeNoticeView() throws IOException{
		return "/admin/notice/notice_write";
	}
	
	@PostMapping("/writeNotice.mdo")
	@Description("공지사항 글 등록")
	public String writeNotice(NoticeBoardVO notice, MultipartHttpServletRequest request) throws IOException{
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
		
		//공지사항 이미지 업로드 기능 
		List<MultipartFile> noImageList = request.getFiles("notice_img[]");
		String oriFilePath = request.getServletContext().getRealPath("/");
		
		for(MultipartFile noImage : noImageList) {
			if(noImage.getOriginalFilename()== null ||  noImage.getOriginalFilename() == "" ) {
			    System.out.println("noImageList 파일이 업로드되지 않았습니다.");
				System.err.println("이미지 없다");
				break;
			}

			ImageVO novo = new ImageVO();
			novo.setWho("admin");
			novo.setImageBy(notice.getNoWriter());
			novo.setImageStatus("공지");
			
			fileController.insertNoticeImage(noImageList, oriFilePath, novo, NoticeIdName);
			System.err.println("공지 이미지 등록");
			break;
		}
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
	public String updateNoticeBoard(@ModelAttribute("notice") NoticeBoardVO notice, MultipartHttpServletRequest request, HttpServletRequest httpre) throws IllegalStateException, IOException {
		
		System.out.println(notice.toString());
		
//		if(httpre.getParameter("deleteList")!= null) {
//			System.err.println("상세 이미지 삭제한다.");
//			System.err.println("삭제할 이미지 : " + httpre.getParameter("deleteList"));
//			
//			// 삭제할 이미지 리스트
//			String[] deletelist = httpre.getParameter("deleteList").split(",");
//			System.err.println(">>deletelist : " + deletelist);
//			
//			for(int i=0; i<deletelist.length; i++) {
//				noticeBoardService.deleteImage(deletelist[i]);
//				System.err.println("삭제 : " + deletelist[i]);
//			}
//		}
		
		String oriFilePath = request.getServletContext().getRealPath("/");
		
		//이미지 업로드 기능
		if(httpre.getParameter("notice_imageList") != null) {
			List<MultipartFile> noticeList = request.getFiles("notice_Changeimg[]");
			
			for(MultipartFile noticeFile : noticeList) {
				if(noticeFile.getOriginalFilename()== null ||  noticeFile.getOriginalFilename() == "" ) {
				    System.out.println("noticeList 파일이 업로드되지 않았습니다.");
					System.err.println("추가 상세 이미지 없다");
					break;
				}
				ImageVO novo = new ImageVO();
				novo.setImageBy(notice.getNoWriter());
				novo.setWho("admin");
				novo.setImageStatus("공지");
				
				fileController.updateNoticeImage(noticeList, oriFilePath, novo);
				System.err.println("이미지 수정");
				break;
			}
		}
		
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
