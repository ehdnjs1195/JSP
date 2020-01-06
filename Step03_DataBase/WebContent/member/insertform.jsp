<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원 추가하기</h1>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" id="name" name="name" />
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" id="addr" name="addr" />
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<button class="btn btn-danger" type="reset">지우기</button>
		<button class="btn btn-warning"><a href="list.jsp">취소</a></button>
	</form>
</div>
</body>
</html>