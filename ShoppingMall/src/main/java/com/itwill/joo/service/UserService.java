package com.itwill.joo.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.UserCreateDto;
import com.itwill.joo.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {
	
	private final BCryptPasswordEncoder passwordEncoder;
	private final UserRepository userRepository;
	
	public User select(String email) {
		return userRepository.selectUser(email);
	}
	
	public int create(UserCreateDto dto) {
		String password = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(password);
		User user = dto.toEntity();
		
		return userRepository.createUser(user);
	}

}
