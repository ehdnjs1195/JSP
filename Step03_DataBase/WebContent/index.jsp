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

<!-- jquery + bootstrap javascript 로딩 (화면을 줄였을 때 동작하는 navbar 만들기 위해서)-->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<%-- include/navbar.jsp 페이지 포함시키기 (네비바를 include시켜주어 메인 컨텐츠에만 집중할 수 있게 된다.)--%>
<jsp:include page="include/navbar.jsp"></jsp:include>
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
	  (여러 jsp가 공동으로 응답한다!)  
	
	
	따로 불러들일 조각 코딩, include를 만들 수 있다.
	(jsp 기능으로 특별한 마크업이있다.)
--%>
<jsp:include page="include/footer.jsp"></jsp:include>	
</body>
</html>
<!-- 
	\${}는 특별한 의미를 갖는다. (역슬래시가 붙어야함. 아니면 코드로 인식됨)
	
-->