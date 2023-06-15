package com.itwill.joo.dto;

import com.itwill.joo.domain.Review;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ReviewUpdateDto {
	
	private long u_id;
	private String rcontent;
	private int rratings;
	
	public Review toEntity() {
		return Review.builder()
				.u_id(u_id)
				.rcontent(rcontent)
				.rratings(rratings)
				.build();
	}

}
