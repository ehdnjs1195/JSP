<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String searchFrom=request.getParameter("searchFrom");
	String searchTxt=request.getParameter("searchTxt");
	CafeDto dto=new CafeDto();
	dto.setSearchFrom(searchFrom);
	dto.setSearchTxt(searchTxt);
	
	List<CafeDto> list=CafeDao.getInstance().getSearchList(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/searchList.jsp</title>
</head>
<body>
<div class="container">
	<h1>검색 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(CafeDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getViewCount()  %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<%}%>
		</tbody>
	</table>
</div>
</body>
</html>