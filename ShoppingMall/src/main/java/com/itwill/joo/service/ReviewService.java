package com.itwill.joo.service;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.ReviewCreateDto;
import com.itwill.joo.repository.ReplyRepository;
import com.itwill.joo.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {
	
	private final ReviewRepository reviewRepository; 
	private final ReplyRepository reviewReplyRepositort;
	
	public int create(ReviewCreateDto dto) {
		log.info("create({})", dto);
		
		return reviewRepository.insert(dto.toEntity());
	}

}