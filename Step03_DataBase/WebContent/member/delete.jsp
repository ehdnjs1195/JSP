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
	<script>
		//알림창 띄우기
		alert("<%=num%> 번 회원의 정보를 삭제 했습니다.");
		//javascript 에서 페이지 이동
		location.href="list.jsp";
	</script>
<%}else{ %>
	<script>
		alert("삭제 실패!");
		location.href="list.jsp";
	</script>
<%} %>
<a href="list.jsp">목록으로 돌아가기</a>

</html>