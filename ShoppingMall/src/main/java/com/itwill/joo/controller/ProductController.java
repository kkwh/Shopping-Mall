package com.itwill.joo.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.service.BasketProductService;
import com.itwill.joo.service.BasketService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor // 생성자 자동 생성
@RequestMapping("/product") // "/post" 로 시작하는 주소 다처리
@Controller
public class ProductController {

    
    private final UserService userService;
    private final BasketService basketService;
    private final BasketProductService basketProductService;
    
	@GetMapping("/productsList")
	public void productList() {

	}

	@GetMapping("/productsHotList")
	public void productsHotList() {

	}

	@GetMapping("/productsNewList")
	public void productsNewList() {

	}
	//상품상세보기 페이지
    @GetMapping("/productDetail")
    public void postDetail(Principal principal, Model model) {
        long userId = userService.select(principal.getName()).getId();
        long basketId = basketService.selectByUserId(userId).getId();
        
        log.info("userId = {}, basketId = {}", userId, basketId);
        
        model.addAttribute("basketId", basketId);
    }
    
    
}