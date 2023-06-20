package com.itwill.joo.repository;

import org.apache.ibatis.annotations.Param;

import com.itwill.joo.domain.User;
import com.itwill.joo.dto.user.FindLoginIdDto;
import com.itwill.joo.dto.user.FindPasswordDto;
import com.itwill.joo.dto.user.UserAuthenticationDto;

public interface UserRepository {
	
	User selectUserByEmail(String email);
	
	User selectUserByLoginId(String login_id);
	
	String selectLoginIdByEmailAndName(FindLoginIdDto dto);

	int createUser(User user);
	
	int createUserBasket(long u_id);
	
	int createKakaoUser(User user);
	
	int updateUser(User user);
	
	int updatePassword(@Param("loginId") String loginId, @Param("password") String password);
	
	int deleteUserById(long id);

	// 채한별:
	// 유저 아이디로 찾기
    User selectUserById(long id);

	int selectByLoginIdAndEmail(FindPasswordDto dto);

}
