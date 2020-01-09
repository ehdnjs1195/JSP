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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="category"/>
</jsp:include>
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
		<%for(TodoDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum()%>">수정</a></td>
				<td><a href="javascript:deleteConfirm(<%=tmp.getNum()%>);">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
<script>
	function deleteConfirm(num){
		var isDelete=confirm(num+"번 목록을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp?num="+num;
		}
	}
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>