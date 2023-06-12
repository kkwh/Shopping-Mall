package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderProduct {
	
	private long id;
	private long p_id; // 주문한 상품 아이디
	private long o_id; // 주문 아이디

	private int pcount; // 상품 수량
	private int pprice; // 상품 가격

}
