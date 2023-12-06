package com.w2.client.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<ReviewVO> getReviewOrderList(ReviewVO review){
		
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewOrderList", review);
	}
	
	public List<ReviewVO> getReviewList(ReviewVO review){
		return sqlSessionTemplate.selectList("ReviewDAO.getReviewList", review);
	}

	public void writeReview(ReviewVO review) {
		sqlSessionTemplate.insert("ReviewDAO.writeReview", review);
	}

	public void deleteReview(ReviewVO review) {
		sqlSessionTemplate.insert("ReviewDAO.deleteReview", review);
	}

	public ReviewVO reviewCheck(ReviewVO review) {
		return sqlSessionTemplate.selectOne("ReviewDAO.reviewCheck", review);
	}

}
