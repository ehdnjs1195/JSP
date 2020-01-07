<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 파라미터 추출
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	String n=request.getParameter("num");
	int num=Integer.parseInt(n);
	//2. MemberDao 객체를 이용해서 DB 에 수정 반영
	MemberDto dto=new MemberDto(num, name, addr);
	boolean isSuccess=MemberDao.getInstance().update(dto);
	//3. 응답
%>
<div class="container">
	<%if(isSuccess){ %>
	<script>
		alert("수정 했습니다.");
		location.href="list.jsp";
	</script>
	<%}else{ %>
	<script>
		alert("수정 실패!");
		location.href="list.jsp";
	</script>
	<%} %>
	<a href="list.jsp">목록으로 돌아가기</a>
</div>
</body>
</html>