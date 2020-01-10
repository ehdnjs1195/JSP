<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request 에 담긴 String type 얻어내기 (key값으로, value값 return받기)
	String myName=(String)request.getAttribute("myName");		//return 타입은 Object 이므로 value의 type으로 캐스팅이 필요함.
	//session 에 담긴 String type 얻어내기
	String yourName=(String)session.getAttribute("yourName");
	//application 에 담긴 String type 얻어내기
	String ourName=(String)application.getAttribute("ourName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/other.jsp</title>
</head>
<body>
	<p>request의 myName : <strong><%=myName %></strong></p>		<!-- other.jsp로 왔을때  응답이 이미 끝났으므로 null, 하나의 jsp에서만 사용할 수 있다. -->
	<p>session의 yourName: <strong><%=yourName %></strong></p>	<!-- 웹 브라우저를 닫았다가 주소를 다시 입력해서 갔을때 null -->
	<p>application의 ourName: <strong><%=ourName %></strong></p>	<!-- 서버를 restart 했을 때 null -->
	<a href="reset.jsp">모든 영역에 담긴 내용  삭제하러 가기</a>
</body>
</html>