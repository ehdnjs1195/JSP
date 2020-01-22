<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%-- uri 따옴표 안에서 ctrl+space 4번째, prefix 따옴표 안에서 ctrl+space --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test04.jsp</title>
</head>
<body>
<% 
	request.setAttribute("size", 123456789);
	request.setAttribute("weight", 1234.56789);
	request.setAttribute("price", 1250000);
%>
<h3>JSTL fmt 테스트</h3>	<%-- fmt 숫자,날짜 등의 format을 알아서 해준다. --%>
<p> size : <strong>${size }</strong> byte</p>
<p> size : <strong><fmt:formatNumber value="${size }"/></strong> byte</p>	<%-- formatNumber를 /를 이용해서 직접 닫아준다.  --%>
<p> weight : <strong>${weight} </strong> g</p>
<p> weight : <strong><fmt:formatNumber value="${weight }" pattern="#,###.## kg"/></strong></p>
<p> 노트북 price : <strong>${price }</strong> 원</p>
<p> 노트북 price : <strong><fmt:formatNumber value="${price }" type="currency" currencySymbol="$"/></strong> 원</p>
</body>
</html>