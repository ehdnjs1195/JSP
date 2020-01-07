<%@page import="test.login.LoginDao"%>
<%@page import="test.login.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String nick=request.getParameter("nick");
	
	LoginDto dto=new LoginDto(id,pwd,nick);
	LoginDao dao=LoginDao.getInstance();
	boolean s=dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(s){ %>
	<script>
		alert("가입되었습니다.");
		location.href="loginform.jsp";
	</script>
<%} %>
</body>
</html>