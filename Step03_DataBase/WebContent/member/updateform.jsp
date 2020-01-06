<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	String num=request.getParameter("num");
%>
<div class="container">
	<h1><%=num %>번 회원 정보 수정하기</h1>
	<form action="update.jsp?num=<%=num%>" method="post">
		<h3>수정할 정보를 입력하세요</h3>
		
		<label for="name">
			이름<input type="text" id="name" name="name"/>
		</label>
		<label for="addr">
			주소<input type="text" id="addr" name="addr" />
		</label>
		<button type="submit">수정하기</button>
	</form>
	<a href="list.jsp" type="button">회원 목록으로 돌아가기</a>
</div>
</body>
</html>