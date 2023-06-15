package com.itwill.joo.dto;

import java.time.LocalDateTime;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReviewListDto {
	
	private long id;
	
	private long p_id; // 후기 작성한 상품 아이디
	private long o_id; // 주문 아이디
	private long u_id; // 후기 작성한 사용자 아이디
	
	private String rcontent; // 후기 내용
	private String review_image; // 후기에 올린 이미지 주소
	
	private int rratings; // 별점
	
	private LocalDateTime rcreated_time; // 후기 작성일자
	private LocalDateTime rmodified_time; // 후기 수정일자
	
	public static ReviewListDto fromEntity(Review review) {
		return ReviewListDto.builder()
				.id(review.getId())
				.p_id(review.getP_id())
				.o_id(review.getO_id())
				.u_id(review.getU_id())
				.rcontent(review.getRcontent())
				.review_image(review.getReview_image())
				.rratings(review.getRratings())
				.rcreated_time(review.getRcreated_time())
				.rmodified_time(review.getRmodified_time())
				.build();
	}

}
