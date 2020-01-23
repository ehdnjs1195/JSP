<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<p class="alert alert-success">${name }을 정상적으로 구입 했습니다.</p>
	<a class="alert alert-link" href="../index.jsp">돌아가기</a>
</div>
</body>
</html>