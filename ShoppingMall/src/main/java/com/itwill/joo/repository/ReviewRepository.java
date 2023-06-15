package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.ReplyCreateDto;
import com.itwill.joo.dto.ReviewListDto;

public interface ReviewRepository {
	
	int createReview(Review review);
	List<ReviewListDto> selectReviewByUserIdDesc(long userId);
	Review selectById(long userId);
	int updateRcontentAndRratings(Review reivew);
    int deleteById(long id);
    List<ReviewListDto> selectWithReplyCount();

}