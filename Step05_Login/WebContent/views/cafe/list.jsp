<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	#ul{
		position:relative;
		left: 50%;
		transform: translateX(-50%);
	}
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/cafe/list.jsp">목록</a></li>
	</ol>
	<h1>글 목록 입니다.</h1>
	<table class="table table-striped table-condensed">
		<colgroup>
			<col class="col-xs-1"/>
			<col class="col-xs-2"/>
			<col class="col-xs-5"/>
			<col class="col-xs-1"/>
			<col class="col-xs-3"/>
		</colgroup>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.num }</td>
					<td>${tmp.writer }</td>
					<td><a href="detail.jsp?num=${tmp.num }&pageNum=${pageNum }">${tmp.title }</a></td>
					<td>${tmp.viewCount }</td>
					<td>${tmp.regdate }</td>
				</tr>			
			</c:forEach>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination pagination-sm" id="ul">
			<li>
				<a href="list.jsp?pageNum=1">처음으로</a>
			</li>
			
			<c:choose>
				<c:when test="${startPageNum ne 1 }">
					<li>
						<a href="list.jsp?pageNum=${startPageNum -1 }"><i class="fas fa-arrow-left"></i></a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&laquo;</a>	<!-- javascript: 에 아무것도 적지 않으면 동작하지 않는 링크가 된다. -->
					</li>
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }" step="1">		<%-- for(int i=startPageNum; i<=endPageNum; i++) 과 같은것 --%>
				<c:choose>
					<c:when test="${i eq pageNum }">
						<li class="active">
							<a href="list.jsp?pageNum=${i }">${i }</a>
						</li>			
					</c:when>
					<c:otherwise>
						<li>
							<a href="list.jsp?pageNum=${i }">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${endPageNum lt totalPageCount }">
					<li>
						<a href="list.jsp?pageNum=${endPageNum + 1 }"><i class="fas fa-arrow-right"></i></a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="disabled">
						<a href="javascript:">&raquo;</a>
					</li>
				</c:otherwise>
			</c:choose>
			<li>
				<a href="list.jsp?pageNum=${totalPageCount }">끝으로</a>
			</li>
		</ul>	
	<a class="btn btn-primary pull-right" href="private/insertform.jsp" id="a">새글 작성</a>
	</div>
</div>
</body>
</html>