<%@page import="java.util.List"%>
<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardDto> list=BoardDao.getInstance().getList();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/list.jsp</title>
</head>
<body>
<div class="container">
	<h1>게시글 목록 입니다.</h1>
	<a href="insertform.jsp">글 작성하기</a>
	<table>
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%for(BoardDto tmp:list){ %>
					<th><%=tmp.getNum() %></th>
					<th><%=tmp.getWriter() %></th>
					<th><a href="updateform.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></th>
					<th><%=tmp.getRegdate() %></th>
				<%} %>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>