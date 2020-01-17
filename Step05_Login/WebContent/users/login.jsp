<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//목적지 정보
	String url=request.getParameter("url");
	if(url==null){
		url=request.getContextPath()+"/index.jsp";		//질문 url이 null인 경우가 생기는가? 이미 앞의 loginform.jsp에서 null인 경우를 거르게 되는게 아닌가?	=>답: 항상 loginform.jsp 에서만 로그인이 되는것이 아니라 예를들어 네비바에서 로그인을 하거나 등등의 경우가 있을 수 있으니 login.jsp에서도 한 번 걸러주는 것이 맞다.
	}
	//목적지 정보를 미리 인코딩 해놓는다.
	String encodedUrl=URLEncoder.encode(url);	//파라미터로 받으면 인코딩된것이 다시 디코딩 되어 나오기 때문에 =>인코딩이 필요하다.
	//1. 폼 전송되는 아이디, 비밀번호를 읽어와서
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//2. DB에서 유효한 정보인지를 확인해서
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	boolean isValid=UsersDao.getInstance().isValid(dto);
	//3. 유효한 정보이면 로그인 처리를 하고 유효한 정보가 아니면 다시 로그인을 할 수 있도록 한다.
	if(isValid){
		//로그인 되었다는 의미에서 session 에 "id" 라는 키값으로 아이디를 저장한다.
		session.setAttribute("id", id);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h1>Alert</h1>
	<%if(isValid){ %>
		<script>
			alert("<%=id%> 님 반갑습니다!");
			location.href="<%=url%>";
		</script>
	<%}else{ %>
		<p class="alert alert-danger">
			아이디  혹은 비밀번호가 틀려요!
			<a class="alert alert-link" href="loginform.jsp?url=<%=encodedUrl%>">로그인 재시도</a>	<!-- 틀려도 다시 로그인하러 갔을 때에도  url을 들고 가야한다. 로그인 했을 때 다시 원래 있던 페이지로 돌아가도록. -->
		</p>
	<%} %>
</div>
</body>
</html>