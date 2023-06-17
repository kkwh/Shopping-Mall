package com.itwill.joo.dto.basket;


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
	private long pcount;
	
	private String pname;
	private int pprice;
	
	

	
}
