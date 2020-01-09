<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//1. 폼 전송되는 수정반영할 글정보를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	//2. 저장된 비밀번호를 읽어온다.
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	//3. 저장된 비밀번호와 전송된 비밀번호가 일치하면 수정반영 한다.
	boolean isSuccess=false;
	if(savedPwd.equals(pwd)){
		BoardDto dto=new BoardDto(num,writer,title,content,pwd,"");
		isSuccess=BoardDao.getInstance().update(dto);
	}
	//4. 결과를 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(isSuccess){ %>
	<script>
		alert("수정 되었습니다.");
		location.href="detail.jsp?num=<%=num%>";
	</script>
<%}else{ %>
	<script>
		alert("비밀번호를 확인하세요.");
		location.href="updateform.jsp?num=<%=num%>";
	</script>
<%} %>
</body>
</html>