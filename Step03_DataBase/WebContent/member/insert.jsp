<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 폼전송되는 이름과 주소를 추출해서
	request.setCharacterEncoding("utf-8");	//post 방식 전송을 했을땐 한글 인코딩을 해야 깨지지 않는다.
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//MemberDto 객체에 담기
	MemberDto dto=new MemberDto(0,name,addr);
	//2. MemberDao 객체를 이용해서 DB에 저장하고
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.insert(dto);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>
<%if(isSuccess){ %>
	<p><strong><%=name %>의 정보를 저장했습니다.</strong></p>
	<a href="list.jsp">확인</a>
<%}else{ %>
	<p>저장 실패 했습니다.</p>
	<a href="insertform.jsp">다시 시도</a>
<%} %>

</body>
</html>