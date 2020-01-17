<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에서 로그인 된 아이디 정보를 읽어온다.
	String id=(String)session.getAttribute("id");
	//2. DB 에서 해당 아이디의 정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 개인 정보를 출력해 준다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>	<!-- private 하위의 요청은 LoginFilter로 거르기. 로그인 안한 상태에서 url로 info.jsp 경로를 입력했을 때 로그인을 우선할 수 있도록-->
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a class="btn btn-primary btn-sm" href="updateform.jsp">개인 정보 수정하기</a>
	<a class="btn btn-danger btn-sm" href="javascript:deleteConfirm();">회원 탈퇴</a>
</div>
<script>
	function deleteConfirm(){
		var isDelete=confirm("<%=id%> 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>