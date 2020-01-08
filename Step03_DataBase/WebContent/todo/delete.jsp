<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num=request.getParameter("num");
	
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.delete(Integer.parseInt(num));
	// 리다일렉트 응답(요청을 다시 하라고 클라이언트에게 경로를 알려줌)
	response.sendRedirect("list.jsp");	//location.href="list.jsp" 와 효과가 거의 같다. 
	// 주어진 경로로 요청을 다시하라는 강요. => 이것 또한 응답.
	
%>
