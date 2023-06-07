<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Join Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
</head>
<body>
	<h1>Join page</h1>
	<hr/>
	<div id="join-form" style="width: 50%; margin: 0 auto;">
	<form method="post" action="/joo/user/join">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	  <div class="row mb-3">
	    <label for="loginId" class="col-sm-2 col-form-label">아이디</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="loginId" name="loginId" autofocus>
	    </div>
	    <div class="col-sm-2">
	    <button type="submit" id="id-validate-btn" class="btn btn-primary">중복확인</button>
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="name" class="col-sm-2 col-form-label">이름</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="name" name="name">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="phone" name="phone">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="email" class="col-sm-2 col-form-label">이메일</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" id="email" name="email">
	    </div>
	    <div class="col-sm-2">
	    <button type="submit" id="get-validate-num-btn" class="btn btn-primary">인증번호받기</button>
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="emailConfirm" class="col-sm-2 col-form-label">이메일 인증</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="emailConfirm">
	    </div>
	    <div class="col-sm-2">
	    <button type="submit" id="validate-num-btn" class="btn btn-primary">인증번호확인</button>
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="password" name="password">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="passwordConfirm" class="col-sm-2 col-form-label">비밀번호 확인</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="passwordConfirm">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="street" class="col-sm-2 col-form-label">도로명 주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="street" name="street">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="detailAddress" class="col-sm-2 col-form-label">상세 주소</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="detailAddress" name="detailAddress">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <label for="postcode" class="col-sm-2 col-form-label">우편번호</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="postcode" name="postcode">
	    </div>
	  </div>
	  
	  <button type="submit" class="btn btn-primary">Sign in</button>
	</form>
	
		
	</div>
	
	<script src="../static/js/user-create.js"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>
</body>
</html>