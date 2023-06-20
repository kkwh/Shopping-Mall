package com.itwill.joo.repository;

import com.itwill.joo.domain.Basket;

public interface BasketRepository {
	
	Basket selectByUserId(long userId);

}
