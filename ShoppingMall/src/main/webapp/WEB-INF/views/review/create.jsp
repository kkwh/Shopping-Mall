<%@ page language="java" contentType="text/html;charset=UTF-8" 
		pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>Review Page</title>
	<link rel="stylesheet" type="text/css" href="../static/assets/css/star.css">
	<link 
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" 
            rel="stylesheet" 
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" 
            crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
	<header>
		<h1>후기 작성</h1>
	</header>
	<table width="100%" cellpadding='0' cellspacing='0'>
		<tr>
			<td align="left"><font size="2">
            	<b>상품 이미지</b>
            	<img src="../static/images/a1.JPG"	 width="150" height="100" alt="a1">
            	
            	<br />
            	<br />
            	
			<form name="myform" id="myform" method="post" action="./save">
			    <fieldset>
			        <legend>이모지 별점</legend>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
			    </fieldset>
			</form>
				
			<div>
            </td>
		</tr>
	</table>
	
	<hr>
	<br/>
	<main class="my-2">
            <div class="card">
                <form method="post">
                    <div class="card-body">
                        <div class="my-2">
                            <label class="form-label" for="content">내용</label>
                            <textarea class="form-control"
                                id="content" name="content" required></textarea>
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="author">작성자 아이디</label>
                            <input class="form-control" 
                                type="text" id="author" name="author" required />
                        </div>
                        <div>
                        	<input type="file" id="가나다"/>
                        </div>
                    </div>
                    <div class="d-flex justify-content-center">
                        <button class="mx-1 btn btn-outline-danger" id="btnDelete">취소</button>
                        <button class="mx-1 btn btn-outline-success" id="btnUpdate">등록</button>
                    </div>
                </form>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous"></script>
</body>
</html>




















