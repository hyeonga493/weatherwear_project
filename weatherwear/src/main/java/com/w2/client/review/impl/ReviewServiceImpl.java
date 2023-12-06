package com.w2.client.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w2.client.review.ReviewDAO;
import com.w2.client.review.ReviewService;
import com.w2.client.review.ReviewVO;

@Service("reviewService") 
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO dao;
	
	@Override
	public List<ReviewVO> getReviewOrderList(ReviewVO review) {
		return dao.getReviewOrderList(review);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO review) {
		return dao.getReviewList(review);
	}
	
	@Override
	public void writeReview(ReviewVO review) {
		dao.writeReview(review);
	}

	@Override
	public void deleteReview(ReviewVO review) {
		dao.deleteReview(review);
	}

	@Override
	public ReviewVO reviewCheck(ReviewVO review) {
		return dao.reviewCheck(review);
	}
}
