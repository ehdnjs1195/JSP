<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	
	MemberDao dao=MemberDao.getInstance();
	MemberDto dto=new MemberDto(0,name,addr);
	dao.insert(dto);
%>
<body>
<div class="container">
<h1><%=name %> 님의 정보를 추가 하였습니다.</h1>
<ul>
	<li><a href="list.jsp">회원목록 확인하기</a></li>
	<li><a href="insertform.jsp">새 멤버 추가하기</a></li>
</ul>
</div>
</body>
</html>