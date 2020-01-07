<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDao 객체의 참조값 얻어오기
	MemberDao dao=MemberDao.getInstance();
	//회원 목록 얻어오기
	List<MemberDto> list=dao.getList();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<style>	
	/* navbar 가 상단에 고정 되어 있기 때문에 공간이 남는다. */
	body{
		padding-top: 50px;
	}
</style>

</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li class="active"><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>				
			<li><a href="https://www.riotgames.com/en" target="_blank">게임</a></li>
			<li><a href="https://www.coupang.com/" target="_blank">쇼핑</a></li>
			<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>회원 보기 페이지</li>
	</ol>

	<h1>회원 목록 입니다.</h1>
	<ul class="nav nav-tabs">
		<li><a href="../index.jsp">홈으로 돌아가기</a></li>
		<li><a href="list.jsp">회원 목록 보기</a></li>
		<li><a href="insertform.jsp">회원추가 하러가기</a></li>
		
	</ul>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정 하러가기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(MemberDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getName() %></td>
				<td><%=tmp.getAddr() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
				<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>	
<script src="${pageContext.request.contextPath }/resources/js/jquery.smooth-scroll.js"></script>
</body>
</html>

<!-- 
	Data Base Connection Pool Bean 	(자바에서 객체를 Bean이라 부른다.)
	
	[DbcpBean]
	
	-web의 입장(클라이언트)에서는 DBconnection 객체 하나를 가져오는것은 상당히 무거운 일이다. (1초)
	-서버에서 다수의 클라이언트를 상대한다. 
	-connection 객체 자체가 유한하며 많지 않다. (늘리기 위해서는 비싼 oracle을 써야한다.)
	=> 이러한 무거운 과정을 피하기 위해 DbcpBean을 사용하겠다.
	
	-톰캣 서버가 관리하며 필요할 때 가져다 쓰고 다시 반환하는 시스템이다.
	
	
 -->