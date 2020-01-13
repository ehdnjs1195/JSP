<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/update.jsp</title>
</head>
<body>
<%
	// session 영역에서 id 읽어오기
	String id=(String)session.getAttribute("id");
	// id 를 이용해서 가입정보 얻어오기
	UsersDto dto=UsersDao.getInstance().getData(id);
%>
<div class="container">
	<h1>회원정보 수정폼</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="id" value="<%=id%>"/>	<!-- update.jsp에서 id를 알아야하므로 hidden으로 전달(disabled 처리되면 name으로 파라미터를 전달할 수 없기 때문에), id는 session 영역에 있다.(로그인 된 상태이므로) -->
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=id %>" disabled/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" id="email" name="email" value="<%=dto.getEmail() %>" />
		</div>
		<button type="submit">수정확인</button>
	</form>
</div>
</body>
</html>