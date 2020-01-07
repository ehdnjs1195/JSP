<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.delete(Integer.parseInt(num));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess) {%>
	<script>
		//알림창 띄우기
		alert("<%=num%>번 할 일을 삭제했습니다.");
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

</body>
</html>