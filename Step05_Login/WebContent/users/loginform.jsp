<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loginform.jsp</title>
<style>
body{
	margin: 0;
	padding: 0;
	font-family: sans-serif;
	background: #33495e;
}
.box{
	width: 300px;
	padding: 40px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #191919;
	text-align: center;
}
.box h1{
	color: white;
	text-transform: uppercase;
	font-weight: 500;
}
.box input[type = "text"],.box input[type = "password"]{
	border:0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #3498db;
	padding: 14px 10px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
}
.box input[type = "text"]:focus,.box input[type = "password"]:focus{
	width: 280px;
	border-color: #2ecc71;
}
.box input[type="submit"]{
	border:0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 14px 40px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
}
.box input[type="submit"]:hover{
	background: #2ecc71;
}
a{
	border:0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 2px solid #2ecc71;
	padding: 14px 40px;
	width: 200px;
	outline: none;
	color: white;
	border-radius: 24px;
	transition: 0.25s;
	cursor: pointer;
	
}
a:hover{
	background: #2ecc71;
}

</style>
</head>
<body>
<%
	// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.
	String url=request.getParameter("url");
	if(url==null){//만일 없으면  (url이 null인 경우는 필터를 거치지 않고 loginform.jsp로 왔을 때이다. ex) index.jsp에서 로그인 버튼 눌렀을 때)
		//로그인 성공후에 index.jsp 페이지로 보낼 수 있도록 구성한다.
		url=request.getContextPath()+"/index.jsp";
	}
%>
<form class="box" action="login.jsp" method="post">
	<h1>Login</h1>
		<input type="hidden" name="url" value="<%=url %>" />
		<input type="text" name="id" placeholder="Username"/>
		<input type="password" name="pwd" placeholder="Password"/>
		<input type="submit" name="" value="Login"/>
</form>
</body>
</html>