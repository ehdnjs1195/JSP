<%@page import="test.login.LoginDto"%>
<%@page import="test.login.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	LoginDao dao=LoginDao.getInstance();
	LoginDto dto=dao.getData(id);
	
	if(dto.getPwd().equals(pwd)){
		System.out.println("접속확인");
	}
%>
</body>
<h1><%=dto.getNick() %>님 반갑습니다!</h1>
</html>