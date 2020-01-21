<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- JSTL core 라이브러리를 c 라는 접두어로 사용할 준비하기 --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test01.jsp</title>
</head>
<body>
<h3>JSTL (Java Standard Tag Library) </h3>

<%-- 반복문 --%>
<c:forEach var="i" begin="1" end="5"> 
	<p>${i }</p>
</c:forEach>

<%-- if문(단, else문은 없다. 단일 if문만) --%>
<c:if test="${sessionScope.id == null }">	<%-- empty sessionScope.id 와 같다. --%>
	<p>로그인이 안된 상태입니다.</p>
</c:if>

<c:if test="${sessionScope.id != null }"> 	<%-- not empty sessionScope.id 와 같다. --%>
	<p><strong>${sessionScope.id }</strong> 로 로그인 된 상태입니다.</p>
</c:if>

<%-- 위의 코드를 java 코드로 작업하면 --%>
<%
	String id=(String)session.getAttribute("id");
%>
<%if(id != null){ %>
	<p><strong><%=id %></strong> 로 로그인 된 상태입니다.</p>
<%} %>
</body>
</html>

<%-- EL의 사용 : 마크업에 이질감이 없고 쓰기가 편하다. 또한 가독성이 좋다. --%>

