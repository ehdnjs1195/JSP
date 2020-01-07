<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String content=request.getParameter("content");
	TodoDto dto=new TodoDto(0, content, "");
	boolean isSuccess=TodoDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	.container{
		padding-top: 100px;
	}
</style>
</head>
<body>
<div class="container">
	<h1>알림 페이지</h1>
	<%if(isSuccess){ %>
		<p class="alert alert-success">
			<strong>새 할일을 저장했습니다.</strong>
			<a class="btn btn-primary" href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p class="alert alert-danger">
			저장 실패 했습니다.
			<a class="btn btn-warning" href="insertform.jsp">다시 시도</a>
		</p>
	<%} %>
</div>
</body>
</html>