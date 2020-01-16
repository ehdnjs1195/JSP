<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<%
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}	
	
	//CafeDto 객체에 위에서 계산된 startRowNum 과 endRowNum을 담는다.
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB에서 글 목록을 얻어온다.
	List<CafeDto> list=CafeDao.getInstance().getList(dto);	//전달된 dto에 맞는 정보만 select해 오겠다!
	//2. 글 목록을 응답한다.
%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="cafe" name="category"/>
</jsp:include>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="list.jsp">목록</a></li>
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
			<%for(CafeDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum() %>&pageNum=<%=pageNum %>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getViewCount()  %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<%}%>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination pagination-sm">
			<li>
				<a href="list.jsp?pageNum=1">처음으로</a>
			</li>
			<%if(startPageNum != 1){ %>
				<li>
					<a href="list.jsp?pageNum=<%=startPageNum-1%>"><i class="fas fa-arrow-left"></i></a>
				</li>
			<%}else{%> 
				<li class="disabled">
					<a href="javascript:">&laquo;</a>	<!-- javascript: 에 아무것도 적지 않으면 동작하지 않는 링크가 된다. -->
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %> <!-- 현재 페이지하고 결과가 같으면 active를 추가한다. -->
					<li class="active">
						<a href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					</li>				
				<%}else{ %>
					<li>
						<a href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					</li>
				<%} %>
			<%} %>		
			<%if(endPageNum < totalPageCount){ %>
				<li>
					<a href="list.jsp?pageNum=<%=endPageNum+1%>"><i class="fas fa-arrow-right"></i></a>
				</li>
			<%}else{ %>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			<%} %>
			<li>
				<a href="list.jsp?pageNum=<%=totalPageCount%>">끝으로</a>
			</li>
		</ul>	
	</div>
	<a href="private/insertform.jsp">새글 작성</a>
</div>
</body>
</html>