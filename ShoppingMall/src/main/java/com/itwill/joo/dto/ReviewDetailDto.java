package com.itwill.joo.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class ReviewDetailDto {
	
	private long id;
	
	private long p_id; // 후기 작성한 상품 아이디
	private long o_id; // 주문 아이디
	private long u_id; // 후기 작성한 사용자 아이디
	
	private String rcontent; // 후기 내용
	private String review_image; // 후기에 올린 이미지 주소
	
	private int rratings; // 별점
	
	private LocalDateTime rcreated_time; // 후기 작성일자
	private LocalDateTime rmodified_time; // 후기 수정일자

	public static ReviewDetailDtoBuilder fromEntity(Review entity) {
		return ReviewDetailDto.builder()
				.id(entity.getId())
				.p_id(entity.getP_id())
				.o_id(entity.getO_id())
				.u_id(entity.getU_id())
				.rcontent(entity.getRcontent())
				.rcreated_time(Timestamp.valueOf(entity.getRcreated_time()))
				.rmodified_time(Timestamp.valueOf(entity.getRmodified_time()))
				builder();
	}
	
	
}
