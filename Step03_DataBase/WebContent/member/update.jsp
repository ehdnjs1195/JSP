<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	String n=request.getParameter("num");
	int num=Integer.parseInt(n);
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=new MemberDto(num, name, addr);
	boolean isSuccess=dao.update(dto);
%>
<div class="container">
	<%if(isSuccess){ %>
	<h1><%=num %>수정 하였습니다.</h1>
	<%}else{ %>
	<h1>수정하지 못하였습니다.</h1>
	<%} %>
	<a href="list.jsp">목록으로 돌아가기</a>
</div>
</body>
</html>