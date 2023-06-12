<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>로그인 페이지</title>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
		crossorigin="anonymous">
	<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<div id="container" style="margin: 0 auto; padding: 100px;" class="w-50">
		<form action="/joo/user/loginPro" method="post">
			<div class="row mb-3">
			    <label for="login_id" class="col-sm-2 col-form-label">Email</label>
			    <div class="col-sm-10">
			    	<input type="text" id="login_id" name="login_id" class="form-control" placeholder="아이디 입력" />
			    </div>
		    </div>
		    <div class="row mb-3">
		    	<label for="upassword" class="col-sm-2 col-form-label">Password</label>
		        <div class="col-sm-10">
		      		<input type="password" id="upassword" class="password form-control" name="upassword" placeholder="비밀번호 입력" />
			    	<i class='bx bx-hide eye-icon'></i>
		        </div>
	        </div>
	        
	        <c:if test=" ${ errorMessage != '' }">
	        	<p>Error: <c:out value="${ errorMessage }" /></p>
	        </c:if>
	        
	        <div>
	        	<a href="/joo/user/findId">아이디 찾기</a>
	        	<a href="/joo/user/findPassword">비밀번호 찾기</a>
	        	<a href="/joo/user/join">회원가입</a>
	        </div>
		    <button type="submit" class="btn btn-primary">로그인</button>
		    <a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=106ceddf8917e2e7f047b10bfe41f185&redirect_uri=http://localhost:8081/joo/kakao&response_type=code">
				<img src="../static/assets/kakao/kakao_login.png" style="height:60px">
			</a>   
	    </form>	</div>
	<script src="../static/js/userPage/password-masking.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>