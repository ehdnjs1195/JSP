<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	//1. GET 방식 파라미터로 전달되는 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 글 정보를 얻어온다.
	CafeDto dto=CafeDao.getInstance().getData(num);
	//3. 해당글의 조회수를 1 증가시킨다.
	CafeDao.getInstance().addViewCount(num);
	//4. 글 정보를 등답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/detail.jsp</title>
<style>
	/* div */
	.contents{
		width: 100%;
		border: 1px dotted #cecece;
	}
</style>
</head>
<body>
<div class="container">
	<h1>글 상세 페이지</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<div class="contents"><%=dto.getContent() %></div>	<!-- div로 뿌려주면 에디터로 작성한 것이 그대로 출력된다. (textarea말고) -->
	<a href="list.jsp?pageNum=<%=pageNum %>">목록 보기</a>
</div>
</body>
</html>