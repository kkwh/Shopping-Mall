package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.domain.BasketProduct;
import com.itwill.joo.dto.basket.BasketProductCreateDto;
import com.itwill.joo.dto.basket.BasketProductListDto;
import com.itwill.joo.dto.basket.BasketProductReadDto;
import com.itwill.joo.dto.basket.BasketUpdateDto;
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
	@PostMapping("/productAddBasket")
	@ResponseBody
	public String productAddBasket(@RequestBody BasketProductCreateDto dto) {
		log.info("BasketProduct: add({})", dto);
		
		int result = basketProductService.productAddBasket(dto);
		
		log.info("상품 등록 결과 = {}" ,result );
		
		return "redirect:/user/postDetail";
	}
	
	/**
	//장바구니에 있는 상품인지 체크 checkProductInBas
	@PostMapping("/checkProductInBasket")
	public void checkProductInBasket(@RequestBody BasketProductListDto dto) {
	    
	    boolean inBasket = basketProductService.selectById(dto);
	}
	**/
	//장바구니에 있는 상품인지 체크 
	@GetMapping("/{id}")
	@ResponseBody
	public ResponseEntity<BasketProductReadDto> readById(@PathVariable long id) {
	    log.info("readById(id={})", id);
	    
	    BasketProductReadDto dto = basketProductService.readById(id);
	     log.info("dto={}", dto);
        
        return ResponseEntity.ok(dto);
	}
	//장바구니에 있을 경우 pcount 업데이트. 
	@PutMapping
	public ResponseEntity<Integer> updatePcount(
	        @PathVariable long id,
	        @RequestBody BasketUpdateDto dto){
	    log.info("updatePcount(id={}, dto={}",id,dto);
	    
	    int result = basketProductService.updatePcount(id,dto);
	    return ResponseEntity.ok(result);
	    
	}

}