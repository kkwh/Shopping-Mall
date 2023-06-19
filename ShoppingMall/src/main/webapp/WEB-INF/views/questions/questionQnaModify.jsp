<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>고객문의 상세보기</title>
            <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
                crossorigin="anonymous">
    </head>
    <body>
    <div class="container-fluid">
        <header class="my-2 p-5 text-center text-bg-dark">
            <h1>고객문의 수정</h1>
        </header>
        
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <ul class="navbar-nav bg-light">
                <li class="nav-item">
                    <c:url var="mainPage" value="/"></c:url>
                    <a class="nav-link" href="${ mainPage }">메인 페이지</a>
                </li>
                <li class="nav-item">
                    <c:url var="questionQnaListPage" value="/questions/questionQnaList"/>
                    <a class="nav-link" href="${ questionQnaListPage }">고객문의 목록</a>
                </li>
                <li class="nav-itme">
                    <c:url var="questionQnaDetailPage" value="/questions/questionQnaDetail">
                        <c:param name="id" value="${ question.id }"></c:param>
                    </c:url>
                    <a class="nav-link" href="${ questionQnaDetailPage }">문의 상세 보기</a>
                </li>
            </ul>
        </nav>
        
        <main class="my-2">
            <div class="card">
                <form class="card-body" id="modifyForm">
                   <div class="my-2">
                        <label class="form-label" for="id"></label>
                        <input type="hidden" class="form-control" id="qnid" name="qnid" value="${question.id }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="p_id"></label>
                        <input type="hidden" class="form-control" id="p_id" name="p_id" value="${question.p_id }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qtype">문의 유형</label>
                        <input class="form-control" id="qtype"  name="qtype" value="${ question.qtype }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qtitle">문의 제목</label>
                        <input class="form-control" id="qtitle" name="qtitle" value="${ question.qtitle }" autofocus/>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qcontent">문의 내용</label>
                        <textarea class="form-control" id="qcontent" name="qcontent"  >${ question.qcontent }</textarea>
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="login_id">작성자 아이디</label>
                        <input class="form-control" id="login_id" name="login_id" value="${ login_id }" readonly />
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qcreated_time">작성시간</label>
                        <fmt:formatDate value="${ question.qcreated_time }"
                            pattern="yyyy-MM-dd HH:mm:ss" var="qcreated_time" />
                        <input class="form-control" id="qcreated_time" name="qcreated_time" value="${ question.qcreated_time }" readonly />    
                    </div>
                    <div class="my-2">
                        <label class="form-label" for="qmodified_time">수정시간</label>
                        <fmt:formatDate value="${ question.qmodified_time }"
                            pattern="yyyy-MM-dd HH:mm:ss" var="qmodified_time" />
                        <input class="form-control" id="qmodified_time" name="qmodified_time" value="${ question.qmodified_time }" readonly />                        
                    </div>
                </form>
                
                <c:if test ="${ question.login_id eq login_id }">
                <div class="card-footer">
                    <div class="d-flex justify-content-start">
                        <button type="button" class="mx-1 btn btn-outline-danger" id="btnDelete">삭제</button>
                        <c:if test ="${ question.is_answered == null }">
                        <button class="mx-1 btn btn-outline-success" id="btnUpdate">수정완료</button>
                        </c:if>
                    </div>
                </div>
                </c:if>
            </div>
         </main>
        
        <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
                crossorigin="anonymous"></script>
        <script src="../static/js/questionPage/questionQna-modify.js"></script>
    </div>
    </body>
</html>