<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>JOO</title>
	<link
	    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	    rel="stylesheet"
	    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	    crossorigin="anonymous">
</head>
<body>
	<div id="reviews">
		<table class="table table-dark text-center">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">유저 id</th>
					<th scope="col">리뷰 내용</th>
					<th scope="col">별점</th>
					<th scope="col">작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ reviews }" var="review">
					<tr>
						<td>${ review.id }</td>
						<td>${ review.u_id }</td>
						<td>${ review.rcontent }</td>
						<td>${ review.rratings }</td>
						<td>${ review.rcreated_time }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script
           src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
           integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
           crossorigin="anonymous"></script>
</body>
</html>