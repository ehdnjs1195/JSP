<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송 파라미터로 전송되는 삭제할 글 번호와 비밀번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String pwd=request.getParameter("pwd");
	//비밀번호가 일치하는지 확인한다.
	String savedPwd=BoardDao.getInstance().getData(num).getPwd();
	
	//작업의 성공 여부를 담을 boolean type 지역변수 선언하고 초기값 부여
	boolean isDelete=false;
	//DB에 저장된 비밀번호와 입력한 비밀번호가 만일 같으면
	if(savedPwd.equals(pwd)){
		//삭제한다.
		isDelete=BoardDao.getInstance().delete(num);
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/board/delete.jsp</title>
</head>
<body>
	<%if(isDelete){ %>
		<script>
			alert("<%=num%> 번 글을 삭제했습니다.");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("비밀번호가 틀립니다.");
			location.href="detail.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>