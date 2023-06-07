package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.joo.dto.UserCreateDto;
import com.itwill.joo.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	private final UserService userService;
	
	@GetMapping("/login")
	public String loginPage() {
		return "user/login";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		log.info("join()");
		
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(UserCreateDto dto) {
		log.info("join({})", dto);
		
		int result = userService.create(dto);
		log.info("result = {}", result);
		
		return "redirect:/";
	}
	
	@PostMapping("/logout")
	public void logout() {
		
	}

}
