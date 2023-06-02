package com.itwill.joo.repository;

import com.itwill.joo.domain.User;

public interface UserRepository {
	
	User selectUser(String email);

}
