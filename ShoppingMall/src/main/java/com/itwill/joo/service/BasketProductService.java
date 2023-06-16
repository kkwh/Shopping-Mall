package com.itwill.joo.service;


import java.util.List;


import org.springframework.stereotype.Service;


import com.itwill.joo.dto.basket.BasketProductCreateDto;
import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.repository.BasketProductRepository;
import com.itwill.joo.repository.BasketRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor

@Slf4j
public class BasketProductService {

	private final BasketRepository basketRepository;
	private final BasketProductRepository basketProductRepository;	
	
	/**
	 * 로그인한 회원의 장바구니 리스트를 보여준다.
	 * @param userId
	 * @return
	 */
	
	public List<BasketProductListDto> read(long userId) {
		log.info("read(uid={})", userId);
		
		long b_id = basketRepository.selectByUserId(userId).getId();
		
		log.info("b_id = {}", b_id);
		
		return basketProductRepository.selectOrderByBasketProductIdDesc(b_id);
		
	}
		
	
	
	/**
	 *  회원의 장바구니 상품 개별 삭제 
	 * @param id
	 * @return
	 */
	public int delete(long id) {
		log.info("delete(id={})", id);
		
		return basketProductRepository.deleteById(id);		
	}
	
	/**
	 * userId의 장바구니 상품을 전체 삭제한다.
	 * @param userId
	 * @return
	 */
		public int deleteAll(long userId) {
		log.info("deleteAllBaket(id={})", userId);
		
		//long userId = basketRepository.selectByUserId(userId).getId();
		return basketProductRepository.deleteAll(userId);
		
	}
	
	/**
	 * 상품을 장바구니에 넣는다.
	 * @param userId
	 * @param productId
	 * @return
	 */
	public int productAddBasket(BasketProductCreateDto dto) {
		return basketProductRepository.insertProductAddBasket(dto.toEntity());
		
	}

	
	
	
}
