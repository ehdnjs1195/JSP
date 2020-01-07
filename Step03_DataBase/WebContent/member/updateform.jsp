<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 수정할 회원의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. 수정할 회원의 정보를 form 에 잘 출력해서 응답한다. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
</head>
<body>

<div class="container">
	<h1><%=num %>번 회원 정보 수정하기</h1>
	<form action="update.jsp" method="post">
		<div class="form-group">
			<label for="num">번호</label>
			<input class="form-control" type="text" id="num" value="<%=num %>" disabled/>	<!-- disabled 수정하지 못하도록(display용도), 하지만 전송도 되지않는다(name="num") 전송용을 따로 만들어 주어야함! -->
			<!-- disabled 된 input 요소는 form 전송 했을때 전송되지 않는다.
				따라서 번호도 같이 전송되게 하려면  input type="hidden" 으로 만들어놓고
				form 전송했을 때 번호도 같이 전송되도록 한다. -->
			<input type="hidden" name="num" value="<%=num %>" />
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName() %>" />
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr() %>" />
		</div>
		<button class="btn btn-primary" type="submit">수정확인</button>
		<a href="list.jsp" class="btn btn-warning">취소</a>
	</form>
</div>
</body>
</html>