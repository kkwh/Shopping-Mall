package com.itwill.joo.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.joo.domain.PaymentInfo;
import com.itwill.joo.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/payment")
public class PaymentController {
	
	private final IamportClient iamportClient;
    private final String REST_API = "2600328773634706";
    private final String REST_API_SECRET = "XgywrlDXHt3KLbPRKnwi2GtCc6XPh7bR93NfYdIdELYErDIYezTzGyPj8HsOo1C3Y0e6zcIgR3OvddJX";

    public PaymentController() {
        this.iamportClient = new IamportClient(REST_API, REST_API_SECRET);
    }

	@RequestMapping("/verify/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) 
			throws IamportResponseException, IOException {		
		log.info("paymentByImpUid({})", imp_uid);
		
		return iamportClient.paymentByImpUid(imp_uid);
	}

}
