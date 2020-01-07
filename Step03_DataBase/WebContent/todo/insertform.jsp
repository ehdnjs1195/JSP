<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>	
	/* navbar 가 상단에 고정 되어 있기 때문에 공간이 남는다. */
	body{
		padding-top: 50px;
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
		<li>목록 추가</li>
	</ol>
	<h1>목록 추가하기</h1>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="content">할 일</label>
			<input class="form-control" type="text" id="content" name="content" />
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<a class="btn btn-warning" href="list.jsp">취소</a>
	</form>
</div>
</body>
</html>