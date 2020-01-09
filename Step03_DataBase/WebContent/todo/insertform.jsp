<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
<style>	
	/* navbar 가 상단에 고정 되어 있기 때문에 공간이 남는다. */
	body{
		padding-top: 50px;
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="todo" name="category"/>
</jsp:include>
<div class="container">
	<!-- 현재 페이지의 위치를 좀더 자세히 알려주는 breadcrumb -->
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
		<li>할 일 목록 추가</li>
	</ol>
	<h1>목록 추가하기</h1>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="content">할 일</label>
			<input class="form-control" type="text" id="content" name="content" />
		</div>
		<div class="form-group">
			<label for="deadLine">마감일
				<select name="deadLine" id="deadLine">
					<option value="">선택</option>
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="4">4일</option>
					<option value="5">5일</option>
				</select>
			</label>
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<a class="btn btn-warning" href="list.jsp">취소</a>
	</form>
</div>
</body>
</html>