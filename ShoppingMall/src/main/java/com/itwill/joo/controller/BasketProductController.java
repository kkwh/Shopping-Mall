package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.domain.BasketProduct;
import com.itwill.joo.dto.BasketProductCreateDto;
import com.itwill.joo.dto.BasketProductListDto;
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
	public void basketlist(Model model, Principal principal) {
		log.info("myBasketList()");
		
		
		long userId = userService.select(principal.getName()).getId();
		
		List<BasketProductListDto> list = basketProductService.read(userId);
		
		log.info("size = {}", list.size());
		
		model.addAttribute("basketproducts",list);
		model.addAttribute("userId", userId);
		
	}
	
	//장바구니 개별 삭제
	@PostMapping("/delete")
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
	@PostMapping("/productAddBasket")
	@ResponseBody
	public String productAddBasket(@RequestBody BasketProductCreateDto dto) {
		log.info("BasketProduct: add({})", dto);
		
		int result = basketProductService.productAddBasket(dto);
		log.info("상품 등록 결과 = {}" ,result );
		
		return "redirect:/user/postDetail";
	}
	
	//상품상세보기 페이지
	@GetMapping("/postDetail")
	public void postDetail(Principal principal, Model model) {
		long userId = userService.select(principal.getName()).getId();
		long basketId = basketService.selectByUserId(userId).getId();
		
		log.info("userId = {}, basketId = {}", userId, basketId);
		
		model.addAttribute("basketId", basketId);
	}
	

	
	
}