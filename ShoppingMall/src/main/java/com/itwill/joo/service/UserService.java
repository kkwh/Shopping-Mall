package com.itwill.joo.service;

import org.springframework.stereotype.Service;

import com.itwill.joo.domain.User;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final UserRepository userRepository;
	
	public User select(String email) {
		return userRepository.selectUser(email);
	}

}
