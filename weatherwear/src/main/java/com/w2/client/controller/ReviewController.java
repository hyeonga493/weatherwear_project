package com.w2.client.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.w2.client.review.ReviewService;
import com.w2.client.review.ReviewVO;
import com.w2.file.ImageVO;
import com.w2.file.controller.FileController;

import jdk.jfr.Description;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@Autowired
	private FileController fileController;
	
	// 결제내역 리스트 페이지(팝업창에 관련 내용 안나옴)
	   @RequestMapping("/dodo.do")
	   @Description("결제내역 페이지")
	   public ModelAndView reviewOrder(ReviewVO review, Model model) {
	      
	      List<ReviewVO> result = reviewService.getReviewOrderList(review);
	   
	      model.addAttribute("reviewOrderList", result);
	      
	      System.err.println("model : " + model.toString());

	      ModelAndView mv = new ModelAndView("test/modal");

	      mv.addObject("reSize", result.size());
	      mv.addObject("result", result);
	      
	      return mv;
	   }
	   
	// 결제내역 리스트 페이지
	   @RequestMapping("/dodo2.do")
	   @Description("결제내역 페이지")
	   public ModelAndView reviewOrder2(ReviewVO review, Model model) {
	      
	      List<ReviewVO> result = reviewService.getReviewOrderList(review);
	   
	      model.addAttribute("reviewOrderList", result);
	      
	      System.err.println("model : " + model.toString());

	      ModelAndView mv = new ModelAndView("test/modal2");

	      mv.addObject("reSize", result.size());
	      mv.addObject("result", result);
	      
	      return mv;
	   }
	
	// 결제내역 리스트 페이지
	@RequestMapping("/reviewOrderList.do")
	@Description("결제내역 페이지")
	public String reviewOrderList(ReviewVO review, Model model) {
		List<ReviewVO> result = reviewService.getReviewOrderList(review);
	
		model.addAttribute("reviewOrderList", result);
		
		System.err.println("model : " + model.toString());
		
		return "client/review/review_orderList";
	}
	
	// 리뷰리스트 페이지
	@RequestMapping("/reviewList.do")
	@Description("리뷰목록 페이지")
	public String reviewList(ReviewVO review, Model model) {
		
		model.addAttribute("reviewList", reviewService.getReviewList(review));
		System.err.println("model : " + model.toString());
		return "client/review/review_list";
	}
	
	//리뷰등록
	@PostMapping("/writeReview.do")
	@Description("리뷰 등록")
	public String writeReview(ReviewVO review, MultipartHttpServletRequest request) throws IOException{
		System.err.println("__________review : " + review.toString());
		
		//리뷰 글번호 랜덤 생성
		String reIdName = "";

		// 이름 형식 지정
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMDDHHss");
		Calendar calendar = Calendar.getInstance();
		reIdName = "Rclient"+simpleDateFormat.format(calendar.getTime());
		reIdName += "_" ;
		// 중복 방지
		for(int i=0; i<10; i++) {
			reIdName += (char)((Math.random()*26)+97);
		}

		List<MultipartFile> reImageList = request.getFiles("review_img[]");
		String oriFilePath = request.getServletContext().getRealPath("/");
		
		for(MultipartFile reImage : reImageList) {
			if(reImage.getOriginalFilename()== null ||  reImage.getOriginalFilename() == "" ) {
			    System.out.println("reImageList 파일이 업로드되지 않았습니다.");
				System.err.println("이미지 없다");
				break;
			}

			ImageVO revo = new ImageVO();
			revo.setWho("client");
			revo.setImageBy(review.getClientId());
			revo.setImageStatus("리뷰");
			
			fileController.updateClientImage(reImageList, oriFilePath, revo, reIdName);
			System.err.println("리뷰 이미지 등록");
			break;
		}
		
		System.out.println("QnaIdName : " + reIdName);
		review.setReId(reIdName);
		review.setReImage(reIdName);
		
		System.err.println("@@@@@@@@review insert : " + review);
		String odid = review.getOdId();
		
		System.out.println("odid : " + odid);
		review.setOdId(odid);
		
		System.err.println("@@@@@@@@review insert : " + review);
		
		reviewService.writeReview(review);
		return "redirect: clientDetail.do";
	}
	
	@RequestMapping("/deleteReview.do")
	@Description("리뷰글 삭제")
	public String deleteMyPageQna(HttpServletRequest request, ReviewVO review) {
		reviewService.deleteReview(review);
		
		return "redirect:reviewList.do";
	}
}
