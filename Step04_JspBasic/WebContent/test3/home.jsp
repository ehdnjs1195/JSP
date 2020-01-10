<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test3/scope.jsp</title>
</head>
<body>
<%
	/*
		jsp 에서 기본으로 제공해주는 객체중에서 
		HttpServletRequest, HttpSesstion, ServletContext  type 객체가 있다.
		해당 객체의 참조값은
		request, session, application 이라는 이름의 지역변수에 들어있다.
		때로는 어떤 data 를 각각의 객체에 저장하고 읽어낼 필요가 있다. 	(숫자,문자,Dto,ArrayList ...등)
		
		ex) 로그인을 한 번 하고나면 페이지를 이동할 때 다시 로그인을 할 필요가 없다. 로그인을 했는지 안했는지 인식을 하도록. 
			서버는 하나고 conn 객체는 로그인 할 때 한 번 사용했다가 반납을 한다(conn객체의 유한성). 이때 conn객체 반납 이후에도 로그인 정보를 기억시킬 수 있도록 위의 객체에 저장한다.
		 - request: 응답전까지 기억.
		 - session: 웹브라우저를 닫기 전까지 기억.
		 - application: 서버를 껏다 키기 전까지 기억.
	*/
	
	// .setAttribute(key, value)
	request.setAttribute("myName", "김구라");		//응답하기 전까지 유효. 응답 이후 사라짐. (forward 이동할때 위임하는 페이지로 정보를 전달할때 1회성 데이터 형태.)
	session.setAttribute("yourName", "해골");		//웹 브라우저를 닫기 전까지 유효. (이 사람이 로그인 했는지 안했는지, 어떤 아이디로 로그인 했는지)
	application.setAttribute("ourName", "원숭이");//서버를 restart하기 전까지 유효.
	
%>
<h1>scope 테스트 home</h1>
<ul>
	<li><a href="other.jsp">다른 페이지로 이동!</a></li>
</ul>
</body>
</html>