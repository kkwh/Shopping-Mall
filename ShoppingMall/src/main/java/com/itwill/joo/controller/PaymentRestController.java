package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.dto.payment.PaymentInfoDto;
import com.itwill.joo.service.PaymentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/payment")
public class PaymentRestController {
	
	private final PaymentService paymentService;
	
	@PostMapping("/save")
	public ResponseEntity<Integer> savePayment(@RequestBody PaymentInfoDto dto) {
		int result = paymentService.insertPaymentData(dto);
		
		log.info("result = {}", result);
		
		return ResponseEntity.ok(result);
	}

}
