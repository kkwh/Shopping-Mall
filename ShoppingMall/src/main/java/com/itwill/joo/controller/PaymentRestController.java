package com.itwill.joo.controller;

import java.util.Map;

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
	public ResponseEntity<Integer> savePayment(@RequestBody Map<String, String> map) {
		PaymentInfoDto dto = PaymentInfoDto.builder()
				.o_id(Long.parseLong(map.get("o_id")))
				.imp_uid(map.get("imp_uid"))
				.merchant_uid(map.get("merchant_uid"))
				.pay_method(map.get("pay_method"))
				.amount(Integer.parseInt(map.get("amount")))
				.build();
		
		int result = paymentService.insertPaymentData(dto);
		
		log.info("result = {}", result);
		
		return ResponseEntity.ok(result);
	}

}
