<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup.jsp</title>
</head>
<body>
<%
	//한글 인코딩 설정
	request.setCharacterEncoding("utf-8");	

	String email=request.getParameter("email");				//이메일
	String pwd=request.getParameter("pwd");					//비밀 번호
	String gender=request.getParameter("gender");			//성별	=>선택한 value 값이 넘어온다.
	/*
		취미
		request.getParameterValues() 메소드는 String[] 을 리턴한다.
		리턴된 배열에는 선택한 checkbox 의 value 가 순서대로 들어있다.
		단, 아무것도 선택하지 않았을때는 null이 리턴된다. 
	*/
	String[] hobbys=request.getParameterValues("hobby");	//취미	=>선택한 value들을 순서대로 String[] 배열로 받는다.
	String like=request.getParameter("like");				//좋아하는 것	=>선택한 value 값이 넘어온다.
	String comment=request.getParameter("comment");			//하고싶은 말	=>textArea는 개행기호 까지 같이 읽어와진다. ex)"하나\r\n두울"
	
	System.out.println("email: "+email);
	System.out.println("pwd: "+pwd);
	System.out.println("gender: "+gender);
	System.out.print("[hobby]: ");
	if(hobbys!=null){ //아무것도 선택하지 않으면 null 이므로
		//null 이 아닐때 반복문이 수행되도록 한다.
		for(String tmp:hobbys){
			System.out.print(tmp+" ");
		}
	}
	System.out.println("\r\nlike: "+like);	//value를 명시하지 않으면 "선택" 이 넘어온다.
	System.out.println("comment: "+comment);
	
	
%>
<script>
	alert("<%=email %> 님이 가입했습니다.");
</script>
</body>
</html>