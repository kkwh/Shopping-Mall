package com.itwill.joo.repository;

import com.itwill.joo.domain.User;

public interface UserRepository {
	
	User selectUserByEmail(String email);
	
	User selectUserByLoginId(String login_id);

	int createUser(User user);

}
