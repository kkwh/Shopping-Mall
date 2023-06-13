package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.joo.dto.user.UserCreateDto;
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
	public String loginPage(@RequestParam(name = "errorMessage", required = false) String errorMessage, Model model) {
		model.addAttribute("errorMessage", errorMessage);
		return "user/login";
	}
	
	@GetMapping("/join")
	public String joinPage() {
		log.info("join()");
		
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(UserCreateDto dto, BindingResult bindingResult) {
		log.info("join({})", dto);
		
		if(bindingResult.hasErrors()) {
			System.out.println("error");
			return "user/join";
		}
		
		int result = userService.create(dto);
		log.info("result = {}", result);
		
		return "redirect:/";
	}
	
	@GetMapping("/findId")
	public String findId() {
		return "user/findId";
	}
	
	@PostMapping("/findId")
	@ResponseBody
	public String findId(@RequestParam("name") String name, @RequestParam("email") String email) {
		log.info("findId({}, {})", name, email);
		
		String loginId = userService.getLoginId(name, email);
		log.info("loginId = {}", loginId);
		
		return loginId;
	}
	
	@GetMapping("/findPassword")
	public String finaPassword() {
		return "";
	}
	
	@GetMapping("/myQueries")
	public String myQueries() {
		log.info("myQueries()");
		
		return "user/myQueries";
	}
	
	@PostMapping("/logout")
	public void logout() {
		
	}

}
