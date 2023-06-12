package com.itwill.joo.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.dto.DeliveryInfoDto;
import com.itwill.joo.dto.OrderHistoryDto;
import com.itwill.joo.dto.OrderedProductDto;
import com.itwill.joo.dto.OrdererInfoDto;
import com.itwill.joo.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
	
	private final OrderService orderService;
	
	@GetMapping("/orderPage")
	public String orderPage(Model model) {
	    log.info("orderPage()");
	    
		OrderedProductDto product = orderService.selectOrderedProduct(21);
		OrdererInfoDto user = orderService.selectOrdererInfo(4);
		model.addAttribute("product", product);
		model.addAttribute("user", user);
		
		return "order/orderPage";
	}
	
	@GetMapping("/orderHistory")
	public String orderHistory(Model model) {
	    log.info("orderHistory()");
	    
	    List<OrderHistoryDto> dto = orderService.selectOrderHistory(1);
	    model.addAttribute("orders", dto);
	    
	    return "order/orderHistory";
	}
	
	@GetMapping("/deliveryCheck")
	public String deliveryCheck(@RequestParam("id") long id, Model model) {
	    log.info("deliveryCheck(id={})");
	    
	    DeliveryInfoDto info = orderService.selectDeliveryInfo(id);
	    model.addAttribute("info", info);
	    
	    return "order/deliveryCheck";
	}
	
	
	

}
