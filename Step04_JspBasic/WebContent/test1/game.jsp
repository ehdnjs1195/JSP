<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//context 경로 얻어오기	"/Step04_JspBasic"
	String cPath=request.getContextPath();
	//강제로 리다일렉트 이동 시키기
	//리다일렉트 이동시킬때는 절대 경로로 이동하는것이 일반적이다.
	//따라서 context 경로가 반드시 필요하다.
	response.sendRedirect(cPath+"/test1/study.jsp");	//요청을 다시하라고 응답을 보냄.(응답 자체가 요청을 다시해! 예를들어 로그인을 하지 않았는데 회원전용 공간으로 들어가는 일이 생길때. 강제로 로그인 페이지로 보내버린다.)
	//순간적을 요청이 두번 들어간다. /test1/game.jsp -> /test1/study.jsp(최종 목적지)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test1/game.jsp</title>
</head>
<body>
<p>game 페이지 입니다. 신나게 놀아봅시다!</p>
</body>
</html>