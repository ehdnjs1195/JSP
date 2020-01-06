<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
<%
	String num=request.getParameter("num");
	
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.delete(Integer.parseInt(num));
%>
</body>
<%if(isSuccess) {%>
<h1><%=num %>번 회원을 삭제하였습니다.</h1>
<%} %>
<a href="list.jsp">목록으로 돌아가기</a>

</html>