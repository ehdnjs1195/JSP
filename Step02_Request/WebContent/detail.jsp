<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/detail.jsp</title>
</head>
<% 			//이 영역은 servlet의 service(){} 안쪽이라고 봐도 무방하다. 따라서 HttpServletRequest, HttpServletResponse 의 객체를 참조할 수 있다.
	String n=request.getParameter("num");	//클릭한 링크의 파라미터를 읽어온다.
	int num=Integer.parseInt(n);	//num=1 링크를 누르면 num은 1을 리턴하는 식으로 되는것.
%>
<body>
<h1><%=num %> 번 자세히 보기 Ok!</h1>
</body>
</html>