package com.w2.client.review;

import java.util.List;

public interface ReviewService {

	List<ReviewVO> getReviewOrderList(ReviewVO review);

	List<ReviewVO> getReviewList(ReviewVO review);

	void writeReview(ReviewVO review);

	void deleteReview(ReviewVO review);

	Object reviewCheck(ReviewVO review);
}
