package com.itwill.joo.dto;

import java.security.Timestamp;
import java.time.LocalDateTime;

import com.itwill.joo.domain.Reply;
import com.itwill.joo.domain.Review;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyCreateDto {
	
	private long id;
	
	private long p_id; // 후기 작성한 상품 아이디
	private long o_id; // 주문 아이디
	private long u_id; // 후기 작성한 사용자 아이디
	
	private String rcontent; // 후기 내용
	private String review_image; // 후기에 올린 이미지 주소
	
	private LocalDateTime rcreated_time; // 후기 작성일자
	private LocalDateTime rmodified_time; // 후기 수정일자

	public Reply toEntity() {
		return Reply.builder()
				.id(id)
				.p_id(pid)
				.o_id(oid)
				.u_id(uid)
				.rcontent(rcontent)
				.review_image(review_image)
				.rcreated_time(rcreated_time)
				.rmodified_time(rmodified_time)
				.build();
	}

}



















