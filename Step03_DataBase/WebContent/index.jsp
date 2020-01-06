<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>					<!-- 앞으로 context path는 수정되거나 삭제될 것이므로 적어주지 않도록 한다. -->
<body>
<div class="container">
	<h1 >Welcome! JAVA Class02!</h1>
	<p> context path: ${pageContext.request.contextPath }</p>
	<ul class="nav nav-pills">			
		<li class="active"><a href="member/list.jsp" data-toggle="tab">회원목록보기(member table)</a></li>
	</ul>
</div>
</body>
</html>
<!-- 
	\${}는 특별한 의미를 갖는다. (역슬래시가 붙어야함. 아니면 코드로 인식됨)
	
-->