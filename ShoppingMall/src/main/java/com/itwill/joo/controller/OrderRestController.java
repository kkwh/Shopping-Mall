package com.itwill.joo.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.OrderHistoryDto;
import com.itwill.joo.dto.OrderedProductDto;
import com.itwill.joo.dto.OrdererInfoDto;
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
	
	
	

}
