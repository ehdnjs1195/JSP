<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 문자열 읽어오기
	String msg=request.getParameter("msg");
	if(msg != null){
		//쿠키 객체를 생성 new Cookie(key, values);
		Cookie cookie=new Cookie("savedMsg", msg);
		//쿠키 유지시간을 초단위로 지정한다.
		cookie.setMaxAge(30);	//30초만 유지 되도록. (60*60*24 => 24시간)
		//응답할 때 쿠키도 같이 응답한다.
		response.addCookie(cookie);	// 클라이언트 웹브라우저에 쿠키 저장.
	}//msg가 null이면 건너뛰고 아래의 html 과정을 거친다.
	
	//응답할 때 클라이언트 웹브라우저에 key:value 로 어떤 문자열을 저장할 수 있다.
	//서버가 클라이언트에게 표시를 하는 작업. 여러 클리언트를 상대하는 중에 	그 클리이언트가 다시 요청을 했을 때 그 표시를 보고 누구인지 식별할 수 있다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cook/test1.jsp</title>
</head>
<body>
<h3>쿠키 테스트</h3>
<form action="test1.jsp" method="post">	<%-- submit을 누르면 test1.jsp가 다시 요청되는 구조 --%>
	<label for="msg">저장할 문자열 입력</label>
	<input type="text" name="msg" id="msg" />
	<button type="submit">저장</button>
</form>
<a href="read1.jsp">저장된 쿠키값 읽어오기</a>
</body>
</html>