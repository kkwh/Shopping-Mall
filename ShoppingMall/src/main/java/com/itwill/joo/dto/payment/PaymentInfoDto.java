package com.itwill.joo.dto.payment;

import com.itwill.joo.domain.Payment;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentInfoDto {
	
	private long id;
	private long o_id;
	private String payment_status;
	
	public Payment toEntity() {
		return Payment.builder()
				.id(id)
				.o_id(o_id)
				.payment_status(payment_status)
				.build();
	}

}
