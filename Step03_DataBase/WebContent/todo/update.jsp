<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 파라미터 추출
	String content=request.getParameter("content");
	String seq=request.getParameter("seq");
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 DB 에 수정 반영
	TodoDto dto=new TodoDto(num, content, null);
	boolean isSuccess=TodoDao.getInstance().update(dto);
	//3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<%if(isSuccess){ %>
	<script>
		alert("<%=seq%>번 할 일을 수정 했습니다.");
		location.href="${pageContext.request.contextPath }/todo/list.jsp";	//script를 응답을 보내고, script안에 경로가 있기 때문에 클라이언트가 다시 요청하는 꼴이된다. =>최종 내용은 목록보기가 되는 것이다. 서버가 클라이언트에게 강제로 요청을 다시 하게 하고 최종적으로 목록을 보게하는 것이다.
	</script>														
	<%}else{ %>
		<p>수정 실패!</p>
		<a href="updateform.jsp?=num<%=dto.getNum()%>">다시 시도하러 가기</a>
	<%} %>
</div>
</body>
</html>