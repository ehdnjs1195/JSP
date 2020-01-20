<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request 객체에 담겨서 전달된 쿠키 목록을 읽어온다.
	Cookie[] cookies=request.getCookies();

	//읽어온 문자열을 저장할 지역 변수
	String savedMsg=null;
	//만일 Cookie[] 이 null 이 아니면
	if(cookies != null){
		//반복문 돌면서 Cookie 객체를 하나씩 참조 해서
		for(Cookie tmp:cookies){
			//쿠키의 키값이 "savedMsg" 라면
			if(tmp.getName().equals("savedMsg")){
				//쿠키로 저장된 값을 읽어온다.
				savedMsg=tmp.getValue();
			}
		}
	}
	
	//ex) 	loginform.jsp 에서 아이디 비밀번호 저장하기를 눌렀을 때 쿠키로 저장을 해두고 다음번에 다시 로그인을 시도할 때 자동으로 띄워주는 것.
	//		팝업을 24시간동안 띄우지 않기.
	//		상품을 장바구니에 담아두기.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cook/read1.jsp</title>
</head>
<body>
<p> 쿠키로 저장되었던 문자열 : <strong><%=savedMsg %></strong></p>
</body>
</html>