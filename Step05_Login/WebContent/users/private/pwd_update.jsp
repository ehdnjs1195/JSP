<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 역역에서 id 읽어오기
	String id=(String)session.getAttribute("id");
	//폼 전송되는 구 비밀번호와 신 비밀번호 ㅣ기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//아이디와 구 비밀본호를 이용해서 유효성 검증
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	if(isValid){ //만일 유효한 정보라면(비밀번호가 일치하면)
		//새 비밀번호를 수정 반영한다.
		dto.setPwd(newPwd);
		UsersDao.getInstance().updatePwd(dto);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
<div class="container">
	<%if(isValid){ %>
		<script>
			alert("비밀 번호를 수정했습니다.");
			location.href="info.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("기존 비밀번호가 일치 하지 않습니다.");
			location.href="pwd_updateform.jsp";
		</script>
	<%} %>
</div>
</body>
</html>