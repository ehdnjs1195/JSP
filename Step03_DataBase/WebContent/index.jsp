<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
							<!-- 앞으로 context path는 수정되거나 삭제될 것이므로 적어주지 않도록 한다. -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />

<!-- jquery + bootstrap javascript 로딩 -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 홈페이지 링크와 버튼을 넣어둘 div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">Acorn</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#one">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<!-- xs 영역에서는 숨겨졌다가 버튼을 누르면 나오게 할 컨텐츠 -->
		<div class="collapse navbar-collapse" id="one">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath }/member/list.jsp">회원관리</a></li>				
				<li><a href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a></li>
				<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
				<li><a href="https://comic.naver.com/webtoon/weekday.nhn" target="_blank">웹툰</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="container">
	<h1 >인덱스 입니다!</h1>
	<p> context path: ${pageContext.request.contextPath }</p>
	<ul class="nav nav-pills">			
		<li class="active"><a href="member/list.jsp" data-toggle="tab">회원목록보기(member table)</a></li>
		<li><a href="todo/list.jsp">할일목록</a></li>
	</ul>
	<!-- 깃허브에서 gist 가져오기. <script src="https://gist.github.com/ehdnjs1195/e7f36d95eda04373fb6860cd3c3cc82c.js"></script> -->
</div>
<%-- 
	[/include/footer.jsp 를 포함 시키기] 
	- page="포함 시킬 jsp 페이지의 상대경로"
	- 절대 경로는 동작하지 않는다.
	- jsp 페이지만 가능하다.
	- 포함 시킨 jsp 페이지와 포함된 jsp 페이지가 공동 응답하는 구조로 클라이언트에게 응답하는 원리이다.
	  (두 jsp가 공동으로 응답한다!)  
	
	
	따로 불러들일 조각 코딩, include를 만들 수 있다.
	(jsp 기능으로 특별한 마크업이있다.)
--%>
<jsp:include page="include/footer.jsp"></jsp:include>	
</body>
</html>
<!-- 
	\${}는 특별한 의미를 갖는다. (역슬래시가 붙어야함. 아니면 코드로 인식됨)
	
-->