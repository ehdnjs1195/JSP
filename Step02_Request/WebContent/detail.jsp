<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/detail.jsp</title>
</head>
<% 			//이 영역은 service(){} 안쪽이라고 봐도 무방하다. 따라서 HttpServletRequest, HttpServletResponse 의 객체를 참조할 수 있다.
	String d1=request.getParameter("num");	//클릭한 링크의 파라미터를 읽어온다.
	int num=Integer.parseInt(d1);
%>
<body>
<h1><%=num %> 번 자세히 보기 Ok!</h1>
</body>
</html>