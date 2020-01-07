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
	boolean check=false;
	boolean isNull=true;
	if(id!=null && pwd!=null){
		check=dto.getPwd().equals(pwd);
		isNull=false;
		if(check){
			System.out.println("접속확인");
		}
	}else{
		check=false;
		isNull=true;
	}
%>
</body>
<%if(!isNull){ %>
	<%if(check){ %>
	<script>
		alert("<%=dto.getNick() %>님 반갑습니다!");
		location.href="index.jsp";
	</script>
	<%}else {%>
	<script>
		alert("아이디 혹은 비밀번호가 틀립니다.");
		location.href="loginform.jsp";
	</script>
	<%} %>
<%}else{ %>
	<script>
		alert("아이디 혹은 비밀번호를 입력하시오.");
		location.href="loginform.jsp";
	</script>
<%} %>

</html>