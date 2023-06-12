package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.ReviewCreateDto;
import com.itwill.joo.service.ReviewService;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/review")
@RequiredArgsConstructor
@Controller
public class ReviewController {
	
	private final ReviewService reviewService;
	private final UserService userService;
	
	@GetMapping("/create")
	public void create() {
		log.info("Get: create()");
	}
	
	@PostMapping("/create")
	public String create(ReviewCreateDto dto) {
	    log.info("REVIEW: create({})", dto);
	    
	    int result = reviewService.create(dto);
	    log.info("후기 등록 결과 = {}", result);
	    
	    return "redirect:review/create";
	}

}














