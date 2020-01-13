<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%> 			<%-- text/html형식이 아니라 application/json 형태라는 것을 알려줌. 응답을 했을 때 Object로 받는 것을 알 수 있다. --%>
    								<%-- object로 받아야    .을 찍어서 사용할 수 있다. (단, json형식에 주의할것)--%>
<%
	// 1. ajax 요청과 함께 inputId 라는 파라미터명으로 전달된 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	// 2. DB에 이미 존재하는 아이디 인지 확인한다.
	boolean isExist=UsersDao.getInstance().isExist(inputId);
	// 3. 존재하는지 여부를 json 형식으로 문자열로 응답한다.(javascript 사용이 편하기 때문에)
%>    								
{"isExist":<%=isExist %>}