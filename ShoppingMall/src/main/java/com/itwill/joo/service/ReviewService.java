package com.itwill.joo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.Review;
import com.itwill.joo.dto.ReviewCreateDto;
import com.itwill.joo.dto.ReviewListDto;
import com.itwill.joo.dto.ReviewUpdateDto;
import com.itwill.joo.repository.ReplyRepository;
import com.itwill.joo.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewService {
	
	private final ReviewRepository reviewRepository; 
	private final ReplyRepository reviewReplyRepository;
	
	// 새 후기 작성 페이지
	public int create(ReviewCreateDto dto) {
		log.info("create({})", dto);
		
		return reviewRepository.createReview(dto.toEntity());
	}
	
	// 리뷰 목록 페이지
	public List<ReviewListDto> getReviewList(long userId) {
		return reviewRepository.selectReviewByUserIdDesc(userId);
	}
	
	public void createReviewWithFile(ReviewCreateDto dto, String filePath) {
        // 파일 업로드 로직 구현
        // filePath를 ReviewCreateDto에 설정
        
        // 데이터베이스에 저장하는 로직 구현
        reviewRepository.createReview(dto.toEntity());
    }
	
	// 리뷰 업데이트
		public int update(ReviewUpdateDto review) {
			log.info("update({})", review);
			
			return reviewRepository.updateRcontentAndRratings(review.toEntity());
		}
		
		// 리뷰 삭제 
		public int delete(long id) {
			log.info("delete(id={}", id);
			
			return reviewRepository.deleteById(id);
		}
	
}




















