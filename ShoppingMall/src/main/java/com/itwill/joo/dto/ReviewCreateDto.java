package com.itwill.joo.dto;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewCreateDto {

	private long id;

	private long p_id; // 후기 작성한 상품 아이디
	private long o_id; // 주문 아이디
	private long u_id; // 후기 작성한 사용자 아이디

	private String rcontent; // 후기 내용
	private String review_image; // 후기에 올린 이미지 주소

	private int rratings; //별점

	public Review toEntity() {
		
		return Review.builder()
				.id(id)
				.p_id(p_id)
				.o_id(o_id)
				.u_id(u_id)
				.rcontent(rcontent)
				.review_image(review_image)
				.rratings(rratings)
				.build();
	}

}