package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.ReplyCreateDto;

public interface ReviewRepository {
	
	int insert(Review review);
	List<Review> selectOrderByIdDesc();
	Review selectById(long id);
	int updateTitleAndContent(Review review);
	int deleteBuId(long id);
	List<ReplyCreateDto> selectWithReply();

}