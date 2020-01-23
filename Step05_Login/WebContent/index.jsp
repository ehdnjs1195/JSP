<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 에서 "id" 라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
	//있으면 로그인 된 상태, null 이면 로그인이 안된 상태
	String id=(String)session.getAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<%-- include/resource.jsp 를 include 하기 --%>
<jsp:include page="include/resource.jsp"></jsp:include>
<style>
	.box{
		width: 300px;
		height: 100px;
		border: none;
		position: relative;
		float: left;
		list-style: none;
		padding: 20px;
		margin: 20px;
		box-shadow: 1px 3px 3px 1px #ccc; /* 그림자 추가 */
		font-size: 20px;
		text-align: center;
		vertical-align: middle;
	}
	.box:hover{
		box-shadow: 2px 4px 4px 2px #ccc; /* 그림자 추가 */
		background-color: #ecf0f1;
		cursor: pointer;
	}
</style>
</head>
<body>
<%-- include/navbar.jsp를 include 하기 --%>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1><em>Acorn</em> 공부방</h1>
	<ul>
		<a href="shop/buy.jsp?num=1&name=coffe"><li class="box">Coffee 구입하기</li></a>
		<a href="shop/buy.jsp?num=2&name=sugar"><li class="box">Sugar 구입하기</li></a>
		<a href="cafe/list.jsp"><li class="box">글 목록보기</li></a>
		<a href="file/list.jsp"><li class="box">파일 목록보기</li></a> <%-- 자료실만들기. --%>
		<a href="cook/test1.jsp"><li class="box">쿠키 테스트</li></a>
		<a href="cook/test2.jsp"><li class="box">쿠키테스트2</li></a>
		<a href="popup/parent.html"><li class="box">팝업 테스트</li></a>
		<a href="popup/main.jsp"><li class="box">팝업 테스트2</li></a>	<%-- 쿠키 관련된 작업을 해야하기 때문에 jsp로 만듬 --%>
		<a href="el01"><li class="box">EL 테스트</li></a>
		<a href="el02"><li class="box">EL 테스트2</li></a>
		<a href="el03"><li class="box">EL 테스트3</li></a>
		<a href="el/test04.jsp"><li class="box">EL 테스트4</li></a>
		<a href="jstl/test01.jsp"><li class="box">JSTL 테스트</li></a>
		<a href="jstl/test02.jsp"><li class="box">JSTL 테스트2</li></a>
		<a href="jstl/test03.jsp"><li class="box">JSTL 테스트3</li></a>
		<a href="jstl/test04.jsp"><li class="box">JSTL 테스트4</li></a>
		<a href="fortune"><li class="box">MVC 테스트 (오늘의 운세)</li></a>
		<a href="cafe/list.nhn"><li class="box">MVC 카페글 목록보기</li></a>
	</ul>
</div>
</body>
</html>