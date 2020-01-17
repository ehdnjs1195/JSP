<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 있는 아이디 읽어오기(로그인 하지 않으면 null이다.)
	String id=(String)session.getAttribute("id");
	
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
	int totalRow=FileDao.getInstance().getCount();
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
	
	//FileDto 객체에 위에서 계산된 startRowNum 과 endRowNum을 담는다.
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//1. DB에서 파일 목록을 얻어온다.
	List<FileDto> list=FileDao.getInstance().getList(dto);	//전달된 dto에 맞는 정보만 select해 오겠다!
	//2. 글 목록을 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#ul{
		position:relative;
		left: 50%;
		transform: translateX(-50%);
	}
</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="category"/>
</jsp:include>
<div class="container">
	<h1>파일 목록 입니다.</h1>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>다운횟수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(FileDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><a href="${pageContext.request.contextPath }/file/download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getDownCount() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%if(tmp.getWriter().equals(id)){ %>	<%-- 글 작성자와 세션에 저장된 id가 같을때만 삭제 --%>
							<a href="javascript:deleteConfirm(<%=tmp.getNum()%>)">삭제</a>
						<%}	%>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
	
	<div class="page-display">
		<ul class="pagination pagination-sm" id="ul">
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
	<a class="btn btn-primary pull-right" href="${pageContext.request.contextPath }/file/private/upload_form.jsp" id="a">파일 업로드</a>
	</div>
</div>
<script>
	//삭제 여부를 확인하고 삭제를 진행하는 javascript 함수
	function deleteConfirm(num){
		var isDelete=confirm(num + "번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}
 	}
</script>
</body>
</html>