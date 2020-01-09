<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 글번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 수정할 글 정보를 얻어온다.
	BoardDto dto=BoardDao.getInstance().getData(num);
	//3. 글 수정 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/updateform.jsp</title>
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
		<li><a href="detail.jsp?num=<%=num%>">게시글 보기 페이지</a></li>
		<li>게시글 수정 페이지</li>
	</ol>
	<h1>글정보 수정 폼 입니다.</h1>
	<p>글 번호: <strong><%=dto.getNum() %></strong></p>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<div class="form-group">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" name="writer" id="writer" value="<%=dto.getWriter() %>" />
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control" type="text" name="title" id="title" value="<%=dto.getTitle() %>" />
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" style="width:200px; display:inline;" type="password" name="pwd" id="pwd" placeholder="비밀번호 입력" />
		</div>
		<button class="btn btn-primary" type="submit">확인</button>
		<a class="btn btn-warning" href="detail.jsp?num=<%=num%>">취소</a>
	</form>
</div>
</body>
</html>