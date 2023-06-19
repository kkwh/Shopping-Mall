package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.BasketProduct;
import com.itwill.joo.dto.basket.BasketProductListDto;


public interface BasketProductRepository {

	/**
	 * 장바구니에 넣는다.
	 * @param basketProduct
	 * @return
	 */
	int insertProductAddBasket(BasketProduct basketProduct);
	
	
	/**
	 * 로그인한 회원의 장바구니 리스트를 보여준다.
	 * @param u_Id
	 * @return
	 */	
	//List<BasketProductListDto> selectOrderByBasketProductIdDesc(long u_Id);
	List<BasketProductListDto> selectOrderByBasketProductIdDesc(long b_Id);
	/**
	 * userId의 장바구니 상품을 전체 삭제한다.
	 * @param userId
	 * @return
	 */
	int deleteAll(long userId);
	
	/**
	 * 회원의 장바구니 상품 개별 삭제 
	 * @param id
	 * @return
	 */
	int deleteById(long id);


	/**
	 * basketproject에서 id를 찾는다. 
	 * @param id
	 * @return
	 */
    //boolean selectById(long id);

    
    
    int updatePcount(BasketProduct basketProduct);


    //장바구니에 있는 상품인지 찾기
    BasketProduct selectById(long id);







	
	
	
	
	
	


}

