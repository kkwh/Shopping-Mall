package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.dto.basket.BasketProductDto;
import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.dto.basket.TestDto;
import com.itwill.joo.service.BasketProductService;
import com.itwill.joo.service.BasketService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class BasketProductController {

	private final UserService userService;
	private final BasketService basketService;
	private final BasketProductService basketProductService;
	
	//장바구니 리스트
	@GetMapping("/myBasket")
	public String basketlist(Model model, Principal principal) {
		log.info("myBasketList()");
		
		
		long userId = userService.select(principal.getName()).getId();
		
		List<BasketProductListDto> list = basketProductService.read(userId);
		
		log.info("size = {}", list.size());
		
		model.addAttribute("basketproducts",list);
		model.addAttribute("userId", userId);
		
		return "basket/myBasket";
	}
	
	//장바구니 개별 삭제
	@PostMapping("/deleteProduct")
	public String delete(long id) {
		log.info("delete(id={})", id);
		
		int result = basketProductService.delete(id);
		log.info("delete(id={})", result);
				return "redirect:/user/myBasket";
	}
	
	
	//장바구니 전체 삭제
	@PostMapping("/deleteAll")
	@ResponseBody
	public ResponseEntity<String> deleteAll(Principal principal) {
	    log.info("deleteAll()");
	    
	    long userId = userService.select(principal.getName()).getId();
	    
	    // 장바구니 전체 삭제 서비스 메소드 호출
	    basketProductService.deleteAll(userId);
	    
	    // 장바구니 리스트 페이지로 리다이렉트
	    return ResponseEntity.ok("success");
	}
	
	 //장바구니 상품 추가
	/*
	@PostMapping("/productAddBasket")
	@ResponseBody
	public String productAddBasket(@RequestBody BasketProductCreateDto dto) {
		log.info("BasketProduct: add({})", dto);
		
		int result = basketProductService.productAddBasket(dto);
		
		log.info("상품 등록 결과 = {}" ,result );
		
		return "redirect:/user/postDetail";
	}
	*/

	
	@PostMapping("/test")
	@ResponseBody
	public int test(@RequestBody List<TestDto> list) {
	    for(TestDto dto : list) {
	        log.info("dto = {}", dto);
	    }
	    
	    return list.size();
	}
	
	//장바구니에 있을 경우 pcount 업데이트. 
	@PostMapping("/updatePcount")
	@ResponseBody
	public ResponseEntity<Integer> updatePcount(@RequestBody BasketProductDto dto){
	    log.info("updatePcount(dto={}", dto);
	    
	    //장바구니에 있는 상품인지 체크
	    int result = basketProductService.selectById(dto);
	    int rsp = 0;
	    if(result == 0) {
	        rsp = basketProductService.productAddBasket(dto);
	    } else {
	        rsp = basketProductService.updatePcount(dto);
	    }
	    
	    return ResponseEntity.ok(rsp);
	    
	}

}