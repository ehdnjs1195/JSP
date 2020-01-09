<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">게시판</a></li>
		<li>게시판 작성 페이지</li>
	</ol>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" id="writer" name="writer" />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" id="title" name="title" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
		</div>
		<div class="form-group">
			<label for="pwe">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		<button class="btn btn-primary" type="submit">등록</button>
		<a class="btn btn-warning" href="list.jsp">취소</a>
	</form>
</div>
</body>
</html>