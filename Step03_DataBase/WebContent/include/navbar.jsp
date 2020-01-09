<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// category 라는 파라미터 명으로 전달된 문자열이 있는지 읽어와 본다.
	String category=request.getParameter("category");	
	if(category==null){	//만일 전달된 내용이 없으면
		category="";	//빈 문자열을 대입한다. (NullPointerException 방지) 아래 if문에서 category가 null이면 equals라는 메소드를 사용할 수 없기때문에 
	}
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
				<%-- if문으로 class="active"를 각 페이지에 맞게 동적으로 출력되도록 한다.--%>
				<li <%if(category.equals("member")) {%>class="active"<%} %>><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>				
				<li <%if(category.equals("todo")) {%>class="active"<%} %>><a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a></li>
				<li <%if(category.equals("board")) {%>class="active"<%} %>><a href="${pageContext.request.contextPath }/board/list.jsp">게시판</a></li>
				<li><a href="#">쇼핑</a></li>
				<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- 
	[include하면서 파라미터로 정보를 전달] 
	
	파라미터에 index에 포함되었는지 list에 포함되었는지 등의 정보를 전달할 수 있다.
	=> 각각 페이지에 맞는 css를 적용하기 위해서

-->