<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
	// Model (data)
	List<String> names=new ArrayList<>();		//지역변수는 EL에서 바로 사용할 수 없다. request나 session에 담아서 사용함.
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	//request 영역에 담기
	request.setAttribute("names", names);	//${requestScope.names } 로 참조해서 사용할 수 있다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/jstl/test02</title>
</head>
<body>
<h3>forEach 활용</h3>
<h4>친구 목록 입니다.</h4>		
<ul>
	<c:forEach var="tmp" items="${requestScope.names }">	<%-- 자바의 확장 for문 처럼 생각하면 된다. for(String tmp:names) --%>
		<li>${tmp }</li>
	</c:forEach>
</ul>
<h4>친구 목록 입니다.</h4>
<ul>
	<c:forEach var="tmp" items="${requestScope.names }" varStatus="status">	
		<li>
			status.index : <strong>${status.index }</strong>|	<%-- index를 알 수가 있다. --%>
			status.count : <strong>${status.count }</strong>|
			status.first : <strong>${status.first }</strong>|
			status.last : <strong>${status.last }</strong>
			${tmp }
		</li>
	</c:forEach>
</ul>
</body>
</html>