package com.itwill.joo.dto.basket;


import com.itwill.joo.domain.BasketProduct;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BasketProductListDto {
	
	//제품 이름, 제품 가격,pcount , basketProduct id 
	
	private long id;
	
	private long b_id;
	private long p_id;
	private int pcount;
	
	private String pname;
	private int pprice;
	
	public BasketProduct toEntity() {
	    return BasketProduct.builder()
	            .b_id(b_id)
	            .p_id(p_id)
	            .pcount(pcount)
	            .build();
	}
	
	
}
