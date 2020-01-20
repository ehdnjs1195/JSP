<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/popup/main.jsp</title>
</head>
<body>
<h3>메인 페이지 입니다.</h3>
<p>자동으로 팝업이 뜨는 페이지</p>
<p>Gura 홈쇼핑</p>
<p>미리미리 봄을 준비해요!</p>
<%
	Cookie[] cookies=request.getCookies();
	String isPopup=null;
	if(cookies != null){
		for(Cookie tmp:cookies){
			if(tmp.getName().equals("isPopup")){
				isPopup=tmp.getValue();
			}
		}
	}
%>
<script>
	<%if(isPopup==null){%>
		window.open("sale.jsp", "sale", "width=400, height=400, top=100, left=100");	//페이지가 로딩되는 시점에 자동으로 팝업창이 뜨게 된다.
	<%}%>
</script>
</body>
</html>