<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.html</title>
<link rel="stylesheet" href="/Step02_Request/resources/css/bootstrap.css" />
</head>
<body>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="/Step02_Request/detail?num=1">자세히 보기1</a></li>	<!-- 절대경로로 쓰려면 앞에 context 경로를 쓰면 된다.(/Step02_Request/detail -->
		<li><a href="/Step02_Request/detail?num=2">자세히 보기2</a></li>
		<li><a href="/Step02_Request/detail?num=3">자세히 보기3</a></li>
		<li><a href="/Step02_Request/detail.jsp?num=1">자세히 보기1 (jsp)</a></li>
		<li><a href="/Step02_Request/detail.jsp?num=2">자세히 보기2 (jsp)</a></li>
		<li><a href="/Step02_Request/detail.jsp?num=3">자세히 보기3 (jsp)</a></li>
		<!-- GET 방식 전송 파라미터가 여러개이면 &로 구분해서 작성하면 된다. -->
		<li><a href="sub/view.jsp?num=1&name=kimgura&addr=nrg">보기</a></li>	
		<li><a href="users/loginform.jsp">로그인하러 가기</a></li>
	</ul>
</div>
</body>
</html>

<!-- 
	<형식>
	/xxx(요청명) ? parameter명 = value & parameter=value
	
	주의) GET방식으로 한글을 전달하려면 인코딩을 해서 전달해야 한다.
	
	절대경로를 사용하는 것을 하드코딩이라 한다. /Step02_Request/xxx/xxx
 -->