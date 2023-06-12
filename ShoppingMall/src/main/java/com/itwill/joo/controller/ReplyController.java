package com.itwill.joo.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.ReplyCreateDto;
import com.itwill.joo.service.ReplyService;
import com.itwill.joo.service.ReviewService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/reply")
@RequiredArgsConstructor
@Controller
public class ReplyController {
	
	private final ReplyService replyService;
	
	@PostMapping
	public ResponseEntity<Integer> createReply(@RequestBody ReplyCreateDto dto) {
		log.info("createReply(dto={})", dto);
        
        int result = replyService.create(dto);
        
        return ResponseEntity.ok(result);
    }
	
}
