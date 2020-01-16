<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// category 라는 파라미터 명으로 전달된 문자열이 있는지 읽어와 본다.
	String category=request.getParameter("category");	
	if(category==null){	//만일 전달된 내용이 없으면
		category="";	//빈 문자열을 대입한다. (NullPointerException 방지) 아래 if문에서 category가 null이면 equals라는 메소드를 사용할 수 없기때문에 
	}
	
	//로그인 된 아이디 읽어와 보기
	String id=(String)session.getAttribute("id");
	
%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp"><i class="fab fa-youtube"></i>Acorn</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠 -->
		<div class="collapse navbar-collapse" id="one">
			<ul class="nav navbar-nav">
				<li <%if(category.equals("cafe")){ %>class="active"<%} %> ><a href="${pageContext.request.contextPath }/cafe/list.jsp">Cafe</a></li>
				<li><a href="#">Shop</a></li>
			</ul>
			<%if(id==null){ //로그인 안된 상태 %>
				<div class="pull-right">
					<a class="btn btn-primary navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/loginform.jsp">로그인</a>	<%-- 어디에 포함될지 모르니 절대경로를 넣어준다. --%>
					<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/signup_form.jsp">회원가입</a>
				</div>
			<%}else{ //로그인 된 상태 %>
				<div class="pull-right">
					<strong><a class="navbar-link" href="${pageContext.request.contextPath }/users/private/info.jsp"><i class="fas fa-user"></i><%=id %></a></strong>
					<a class="btn btn-warning navbar-btn btn-xs" href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
				</div>
			<%} %>
		</div>
	</div>
</div>

<!-- 
	[include하면서 파라미터로 정보를 전달] 
	
	파라미터에 index에 포함되었는지 list에 포함되었는지 등의 정보를 전달할 수 있다.
	=> 각각 페이지에 맞는 css를 적용하기 위해서

-->