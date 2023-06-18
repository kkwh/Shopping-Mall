package com.itwill.joo.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.joo.dto.order.DeliveryInfoDto;
import com.itwill.joo.dto.order.OrderByBasketDto;
import com.itwill.joo.dto.order.OrderCancelHistoryDto;
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
    public String orderPage(Model model, Principal principal) {
        log.info("orderPage()");
        
        long id = userService.getUserInfo(principal.getName()).getId();
        log.info("principal : " + id);
        
        OrderedProductDto product = orderService.selectOrderedProduct(6); // param: 상품 id
        OrdererInfoDto user = orderService.selectOrdererInfo(id); // param: 유저 id
        model.addAttribute("product", product);
        model.addAttribute("user", user);
        
        return "order/orderPage";
    }
    
    @GetMapping("/orderHistory")
    public String orderHistory(Model model) {
        log.info("orderHistory()");
        
        //long id = userService.getUserInfo(principal.getName()).getId();
        //log.info("principal : " + id);
        
        List<OrderHistoryDto> dto = orderService.selectOrderHistory(4);
        List<OrderCancelHistoryDto> dto2 = orderService.selectOrderCancelHistory(4);
        
        model.addAttribute("orders", dto);
        model.addAttribute("cancels", dto2);
        
        return "order/orderHistory";
    }
    
    @GetMapping("/deliveryCheck")
    public String deliveryCheck(@RequestParam("id") long id, Model model) {
        log.info("deliveryCheck(id={})");
        
        DeliveryInfoDto info = orderService.selectDeliveryInfo(id);
        
        // 현재 날짜에서 3일을 더한 값을 계산 (배송조회 예상 배송일에 사용)
        Calendar cal = Calendar.getInstance();
        cal.setTime(info.getDcreated_time());
        cal.add(Calendar.DAY_OF_MONTH, 3);
        Date threeDaysLater = cal.getTime();

        model.addAttribute("threeDaysLater", threeDaysLater);
        model.addAttribute("info", info);
        
        return "order/deliveryCheck"; 
    }
    
    @GetMapping("/orderPage2")
    public String orderPageByBasket(Model model) {
        log.info("orderPageByBasket()");
        
        //long id = userService.getUserInfo(principal.getName()).getId();
        //log.info("principal : " + id);
        
        List<OrderByBasketDto> infos = orderService.readOrderByBasket(4);
        model.addAttribute("infos", infos);
        
        return "order/orderPage2";
    }
    
    
    

}