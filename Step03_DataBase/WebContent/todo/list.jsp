<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TodoDao dao=TodoDao.getInstance();
	List<TodoDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
		<ul class="nav navbar-nav">
			<li><a href="../member/list.jsp">회원관리</a></li>
			<li class="active"><a href="${pageContext.request.contextPath }/todo/list.jsp">할일 목록</a></li>				
			<li><a href="https://www.coupang.com/" target="_blank">쇼핑</a></li>
			<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
		</ul>
	</div>
</div>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>할일 목록</li>
	</ol>
	<h1>할 일 목록</h1>
	<ul class="nav nav-tabs">
		<li><a href="${pageContext.request.contextPath }/todo/insertform.jsp">할 일 추가하러 가기</a></li>
	</ul>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>할일</th>
				<th>등록일</th>
				<th>수정 하러가기</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(int i=0; i<list.size(); i++){
				TodoDto tmp=list.get(i);%>
			<tr>
				<td><%=i+1 %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum()%>&seq=<%=i+1%>">수정</a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum() %>);">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm("삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>