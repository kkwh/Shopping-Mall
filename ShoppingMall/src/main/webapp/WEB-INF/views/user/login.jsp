<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Page</title>
</head>
<body>
<form action="/joo/user/login" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<input type="text" id="login_id" name="login_id" placeholder="이메일 입력" />
	<input type="password" id="upassword" name="upassword" placeholder="비밀번호 입력" />
 	<button type="submit">로그인</button>
</form>
</body>
</html>