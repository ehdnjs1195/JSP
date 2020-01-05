<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간 페이지</title>
</head>
<body>
<%
	Date d=new Date();
	String info=d.toString();	//마찬가지로 toString(); 은 생략가능한 메소드.
%>
<p> 현재 시간 : <strong><%=d %></strong></p>
</body>
</html>

<!-- 
	jsp는 요청될 때 class로 바뀐다.(객체를 사용할 수 있는 이유!)
	=> jsp는 결국 servlet으로 바뀐다!
	
	서버가 실제로 사용하는 경로 C:\acorn2019\web_work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\Step01_Servlet\org\apache\jsp
	showtime.jsp ㅡ> showtime_jsp.java ㅡ> showtime_jsp.class 
	           change! 				compile!
		먼저 자바 소스코드로 바꾸고 			컴파일하고 		class를 이용해서 객체를 생성하여 쓴다.
	
	showtime_jsp.java를 열어보라! 
	16번 줄에 HttpJspBase를 상속 받고 있다. 즉, servlet 형태란 뜻!
	81번째 줄엔 HttpServletRequest, HttpServletResponse 를 인자로 받고 있다.
	111번째 줄부턴 클라이언트에게 출력하는 모습을 볼 수 있다.
	121번째 줄을 보면 < % % > 안에 코딩 내용은 그대로 service() 메소드 안으로 들어온 모양을 볼 수 있다.
	127번째 줄을 보면 out.print(info)로 출력하고 있다.
	81번째 줄과 90-95번째 줄에 지역변수가 선언되어 있기 때문에 jsp에서도 사용할 수 있게 되는것이다.
	
 -->



