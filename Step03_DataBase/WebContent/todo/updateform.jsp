<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto dto=TodoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>
	body{
		padding-top:50px;
	}
</style>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/todo/list.jsp">할일 목록</a></li>				
			<li><a href="https://www.riotgames.com/en" target="_blank">게임</a></li>
			<li><a href="https://www.coupang.com/" target="_blank">쇼핑</a></li>
			<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>회원 정보 수정 폼</li>
	</ol>
	<h1><%=num %>번 회원 정보 수정하기</h1>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="num">번호</label>
			<input class="form-control" type="text" id="num" value="<%=num %>" disabled/>	<!-- disabled 수정하지 못하도록(display용도), 하지만 전송도 되지않는다(name="num") 전송용을 따로 만들어 주어야함! -->
			<!-- disabled 된 input 요소는 form 전송 했을때 전송되지 않는다.
				따라서 번호도 같이 전송되게 하려면  input type="hidden" 으로 만들어놓고
				form 전송했을 때 번호도 같이 전송되도록 한다. -->
			<input type="hidden" name="num" value="<%=num %>" />
		</div>
		<div class="form-group">
			<label for="content">할일</label>
			<input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent() %>" />
		</div>
		<div class="form-group">
			<label for="regdate">날짜</label>
			<input class="form-control" type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" disabled/>
			<input type="hidden" name="regdate" value="<%=dto.getRegdate() %>" />
		</div>
		<button class="btn btn-primary" type="submit">수정</button>
		<a href="list.jsp" class="btn btn-warning">취소</a>
	</form>
</div>
</body>
</html>