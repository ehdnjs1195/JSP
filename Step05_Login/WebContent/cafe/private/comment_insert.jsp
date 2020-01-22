<%@page import="test.cafe.comment.dto.CommentDto"%>
<%@page import="test.cafe.comment.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	int writeNum=Integer.parseInt(request.getParameter("writeNum"));
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String ip=request.getParameter("ip");
	CommentDto dto=new CommentDto();
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setIp(ip);
	dto.setWriteNum(writeNum);
	CommentDao.getInstance().insert(dto);
	System.out.println(ip+" 님이 "+writeNum +"번 글에 댓글을 달았어요.");
	
	int num=Integer.parseInt(request.getParameter("num"));
	request.setAttribute("num", num);
	
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	request.setAttribute("pageNum", pageNum);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment_insert.jsp</title>
</head>
<body>
<script>
	location.href="${pageContext.request.contextPath}/cafe/detail.jsp?num=${num}&pageNum=${pageNum}"
</script>
</body>
</html>