<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="board" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">게시판</a></li>
		<li>게시판 목록 페이지</li>
	</ol>
	<h1>게시글 목록 입니다.</h1>
	<button class="btn"><a href="insertform.jsp"><i class="far fa-thumbs-up"></i>글 작성하기</a></button>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
<%
	//BoardDao 객체를 이용해서 글 목록을 얻어온다.
	List<BoardDto> list=BoardDao.getInstance().getList();
%>
		<tbody>
			<%for(BoardDto tmp:list){ %>
				<tr>
					<th><%=tmp.getNum() %></th>
					<th><%=tmp.getWriter() %></th>
					<th><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></th>
					<th><%=tmp.getRegdate() %></th>
				</tr>
			<%} %>
		</tbody>
	</table>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>