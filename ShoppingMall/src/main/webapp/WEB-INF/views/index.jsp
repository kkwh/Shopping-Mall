<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Index Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" 
    rel="stylesheet" 
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" 
    crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
	<header class="bg-warning p-2 text-dark bg-opacity-50">
		<h1>메인 페이지</h1>
	</header>	
	<hr>
	<a href="/joo/review/create">후기 작성</a>
	<a href="/joo/review/list">후기 목록</a>
	<sec:authorize access="isAuthenticated()">
		<p>username: <sec:authentication property="principal.username"/></p>
		<form action="/joo/user/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<button>Logout</button>
		</form>
	</sec:authorize>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>	