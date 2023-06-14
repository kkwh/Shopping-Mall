package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.order.DeliveryCreateDto;
import com.itwill.joo.dto.order.OrderCreateDto;
import com.itwill.joo.dto.order.OrderProductCreateDto;
import com.itwill.joo.service.OrderService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/order")
public class OrderRestController {
    
    private final OrderService orderService;
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Integer> deleteOrder(@PathVariable long id) {
        log.info("deleteOrder(id={})", id);
        
        int result = orderService.deleteByOrderId(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 취소완료
    @PutMapping("/cancel/{id}")
    public ResponseEntity<Integer> updateToCancelComple(@PathVariable long id) {
        log.info("updateToCancelComple(id={})", id);
        
        int result = orderService.updateToCancelComple(id);
        
        return ResponseEntity.ok(result);
    }
    
    // -> 구매확정
    @PutMapping("/buy/{id}")
    public ResponseEntity<Integer> updateToBuyComple(@PathVariable long id) {
        log.info("updateToBuyComple(id={})", id);
        
        int result = orderService.updateToBuyComple(id);
        
        return ResponseEntity.ok(result); 
    }
    
    // 결제시 주문 정보 저장
    @PostMapping("/order")
    public ResponseEntity<Long> createOrderInfo(@RequestBody OrderCreateDto dto) {
        log.info("createOrderInfo(dto={})", dto);
        orderService.createOrder(dto);
        
        long id = orderService.readOrderMaxId();
        
        return ResponseEntity.ok(id); 
    }
    
    // 결제시 주문상품 정보 저장
    @PostMapping("/orderProduct")
    public ResponseEntity<?> createOrderProductInfo(@RequestBody OrderProductCreateDto dto) {
        log.info("createOrderProductInfo(dto={})", dto);
        orderService.createOrderProduct(dto);
        
        return ResponseEntity.ok("orderProduct 저장 성공"); 
    }
    
    // 결제시 배송 정보 저장
    @PostMapping("/delivery")
    public ResponseEntity<?> createDeliveryInfo(@RequestBody DeliveryCreateDto dto) {
        log.info("createDeliveryInfo(dto={})", dto);
        orderService.createDelivery(dto);
        
        return ResponseEntity.ok("delivery 저장 성공"); 
    }
    
    
    

}