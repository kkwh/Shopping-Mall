package com.itwill.joo.service;

import org.springframework.stereotype.Service;

import com.itwill.joo.dto.payment.PaymentInfoDto;
import com.itwill.joo.repository.PaymentRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {
	
	private final PaymentRepository paymentRepository;
	
	public int insertPaymentData(PaymentInfoDto dto) {
		log.info("insertPaymentData({})", dto);
		
		return paymentRepository.insertPaymentData(dto.toEntity());
	}

}
