package com.itwill.joo.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.dto.order.DeliveryInfoDto;
import com.itwill.joo.dto.order.OrderByBasketDto;
import com.itwill.joo.dto.order.OrderHistoryDto;
import com.itwill.joo.dto.order.OrderedProductDto;
import com.itwill.joo.dto.order.OrdererInfoDto;
import com.itwill.joo.service.OrderService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {
    
    private final UserService userService;
    private final OrderService orderService;
    
    @GetMapping("/orderPage")
    public String orderPage(Model model) {
        log.info("orderPage()");
        
        // long id = userService.getUserInfo(principal.getName()).getId();
        log.info("프린시플 : ");
        
        OrderedProductDto product = orderService.selectOrderedProduct(21);
        OrdererInfoDto user = orderService.selectOrdererInfo(4);
        model.addAttribute("product", product);
        model.addAttribute("user", user);
        
        return "order/orderPage";
    }
    
    @GetMapping("/orderHistory")
    public String orderHistory(Model model) {
        log.info("orderHistory()");
        
        List<OrderHistoryDto> dto = orderService.selectOrderHistory(4);
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
    
    @GetMapping("/orderPage2")
    public String orderPageByBasket(Model model) {
        log.info("orderPageByBasket()");
        
        List<OrderByBasketDto> infos = orderService.readOrderByBasket(4);
        model.addAttribute("infos", infos);
        
        return "order/orderPage2";
    }
    
    
    

}