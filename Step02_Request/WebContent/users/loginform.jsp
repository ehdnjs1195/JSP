<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
</head>
<body>
<h3>로그인 폼입니다.</h3>
<form action="login.jsp" method="post">
	<label for="id">아이디</label>
	<input type="text" id="id" name="id"/></br>
	<label for="pwd">비밀번호</label>
	<input type="text" id="pwd" name="pwd" /></br>
	<button type="submit">로그인</button>
	<button type="reset">취소</button>
</form>
</body>
</html>
<!-- 
	[경로의 개념]
	WebContent =>최상위 경로 (Step02_Request/ 다음에 오는 경로가 바로 최상위 경로(WebContent), step02의 detail.jsp , index.jsp가 해당된다.)
	절대경로: /context path부터 경로를 모두 표시해주는 것
	상대경로: /로 시작하지 않고 현재 자기가 있는 폴더내의 파일을 나타내는 경로.
	./ 	: 현재 자기가 있는 폴더
	../	: 상위 폴더
	
 -->
<!-- [form 과 server]
	*form -	action="절대경로 or 상대경로"  method="get or post"
		{요청의 목적}
		-get방식: 얻어올때	,특징=>입력한 요청 파라미터를 주소창에 달고간다.
		-post방식: 보낼때
	*parameter 변수는 input의 name이다. =>정해놓은 parameter를 잘 기억해두고 getParameter에서 써야한다.
		두 파라미터의 변수가 다르면 500번의 오류가 발생할 수 있다.서버의 잘못 / 404번 오류는 요청의 잘못
	
	
	*** button의 submit은 반드시 form 안에 있어야만 작동을 한다. form의 submit(제출)도 request의 하나이다. ***
 -->