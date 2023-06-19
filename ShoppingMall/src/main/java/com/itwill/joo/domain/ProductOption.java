package com.itwill.joo.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductOption {
	
	private long id;
	private long productId; // 상품 아이디
	
	private String volume; // 상품 용량
	
	private int price; // 상품 가격
	private int stock; // 상품 재고 (기본값: 0)

}
