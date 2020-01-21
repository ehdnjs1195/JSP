<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>    
<%
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	//1. 폼 전송되는 수정할 글 정보를 파라미터에서 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. DB 에 수정 반영하고
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	boolean isSuccess=CafeDao.getInstance().update(dto);
	//3. 응답한다.
	
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("num", num);
	request.setAttribute("isSuccess", isSuccess);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cafe/private/update.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<c:choose>
		<c:when test="${isSuccess }">
			<script>
				alert("글을 수정했습니다.");
				location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=${num}&pageNum=${pageNum}";
			</script>
		</c:when>
		<c:otherwise>
			<h1>Alert</h1>
			<p class="alert alert-danger">글 수정 실패<a class="alert-link" href="updateform.jsp?num=${num }&pageNum=${pageNum}">다시 시도</a></p>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>