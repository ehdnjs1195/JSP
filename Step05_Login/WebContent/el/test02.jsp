<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/el/test02.jsp</title>
</head>
<body>
<h3>EL 테스트중...</h3>
<%
	UsersDto dto=(UsersDto)request.getAttribute("dto");
%>
<p> 
	아이디 : <strong><%=dto.getId() %></strong>
	이메일 : <strong><%=dto.getEmail() %></strong>
	등록일 : <strong><%=dto.getRegdate() %></strong>	<%-- 여기선 null --%>
</p>
<%-- 위의 코드를 EL 을 이용하면 아래와 같다. 필드명만 적어줘도 된다. --%>
<p>
	ID : <strong>${requestScope.dto.getId() }</strong>  <%-- ↓ requestScope 생략, getter 생략.  --%>
	Email : <strong>${dto.email }</strong>
	RegDate : <stong>${dto.regdate }</stong>	<%-- EL은 아예 아무것도 찍지 않는다.(편리한 점이 있음, NullPointException 이 발생하지 않는다.) --%>
</p>
</body>
</html>