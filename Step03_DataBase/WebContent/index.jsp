<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
							<!-- 앞으로 context path는 수정되거나 삭제될 것이므로 적어주지 않도록 한다. -->
</head>
<body>
<div class="navbar navbar-inverse navbar-fiexd-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>				
			<li><a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a></li>
			<li><a href="https://www.coupang.com/" target="_blank">쇼핑</a></li>
			<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
	</div>
</div>
<div class="container">
	<h1 >인덱스 입니다!</h1>
	<p> context path: ${pageContext.request.contextPath }</p>
	<ul class="nav nav-pills">			
		<li class="active"><a href="member/list.jsp" data-toggle="tab">회원목록보기(member table)</a></li>
		<li><a href="todo/list.jsp">할일목록</a></li>
	</ul>
	<script src="https://gist.github.com/ehdnjs1195/e7f36d95eda04373fb6860cd3c3cc82c.js"></script>
</div>
</body>
</html>
<!-- 
	\${}는 특별한 의미를 갖는다. (역슬래시가 붙어야함. 아니면 코드로 인식됨)
	
-->