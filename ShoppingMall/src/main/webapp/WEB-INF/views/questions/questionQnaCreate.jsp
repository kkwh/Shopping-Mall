<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Qna Create</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .card {
            margin-top: 20px;
        }
        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <header class="my-2 p-5 text-center text-primary">
            <h1>QnA 작성</h1>
        </header>

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <c:url var="mainPage" value="/" /> 
                    <a class="nav-link" href="${mainPage}">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionQnaListPage" value="/questions/questionQnaList" /> 
                    <a class="nav-link" href="${questionQnaListPage}">문의사항 목록</a>
                </li>
            </ul>
        </nav>

        <main class="my-2">
            <div class="card">
                <form method="post">
                    <div class="card-body">
                        <div class="my-2">
                            <input class="form-control" type="hidden" id="userId" name="u_id" value="${userid}" required readonly />
                        </div> 
                        <div class="my-2">
                            <label class="form-label" for="questionType">문의 유형</label>
                            <select class="form-select" id="questionType" name="qtype">
                                <option>취소관련</option>
                                <option>주문관련</option>
                                <option>회원정보</option>
                                <option>서비스</option>
                                <option>기타</option>
                            </select>
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionTitle">문의 제목</label> 
                            <input class="form-control" type="text" id="questionTitle" name="qtitle" required autofocus />
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="questionContent">문의 내용</label>
                            <textarea class="form-control" id="questionContent" name="qcontent" rows="5" required></textarea>
                        </div>
                        <div class="my-2">
                            <label class="form-label" for="login_id">작성자 아이디</label>
                            <input class="form-control" type="text" id="login_id" name="login_id" value="${login_id}" required readonly />
                        </div> 
                    </div>
                    <div class="card-footer my-2">
                        <input class="form-control btn btn-primary" type="submit" value="문의 작성" />
                    </div>
                </form>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </div>
</body>
</html>
