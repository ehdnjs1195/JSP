<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>	<!-- 경로는 카멜케이스로 쓰지 않는다. 두 단어 정도는 그냥 쓰거나 언더바를 쓴다. -->
<!-- bootstrap css 로딩하기 -->
<link rel="stylesheet" href="/Step02_Request/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>회원 추가 양식 입니다.</h1>
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" id="name" name="name" />
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" id="addr" name="addr" />
		</div>
		<button class="btn btn-primary" type="submit">추가</button>
		<button class="btn btn-warning">취소</button>
	</form>
</div>
</body>
</html>