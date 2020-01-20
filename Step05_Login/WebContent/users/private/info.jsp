<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 세션에서 로그인 된 아이디 정보를 읽어온다.
	String id=(String)session.getAttribute("id");
	//2. DB 에서 해당 아이디의 정보를 얻어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 개인 정보를 출력해 준다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>	<!-- private 하위의 요청은 LoginFilter로 거르기. 로그인 안한 상태에서 url로 info.jsp 경로를 입력했을 때 로그인을 우선할 수 있도록-->
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지가 가로 세로 50px 인 원형으로 표시될 수 있도록*/
	#profileLink img{
		width: 50px;
		height: 50px;
		border-radius: 50%;	
	}
	#profileForm{
		display: none;
	}
</style>
</head>
<body>
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>개인정보 페이지</h1>
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<a href="javascript:" id="profileLink">
					<%if(dto.getProfile()==null){ %> <!-- 프로필 이미지가 등록이 되어있지 않은경우 -->
						<img src="${pageContext.request.contextPath }/resources/images/default_user.jpeg" alt="" />
					<%}else{ %>	<!-- 저장된게 있으면 -->
						<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>" alt="" />	<!-- 경로를 출력. upload폴더에 저장을 해두고. /upload/14245152xx.jpg -->
					<%} %>
				</a>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a href="pwd_updateform.jsp">수정하기</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a class="btn btn-primary btn-sm" href="updateform.jsp">개인 정보 수정하기</a>
	<a class="btn btn-danger btn-sm" href="javascript:deleteConfirm();">회원 탈퇴</a>
</div>
<form action="profile_upload.jsp" method="post" enctype="multipart/form-data" id="profileForm">
	<label for="profile">프로필 이미지 선택</label>
	<input type="file" name="profileImage" id="profileImage" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />	<%-- 확장자를 정해준 것만 보이도록 한다. --%>
</form>
<%-- jquery form 플러그인 javascript 로딩 --%>
<script src="${pageContext.request.contextPath }/resources/js/jquery.form.min.js"></script>
<script>
	//프로파일 이미지를 클릭하면
	$("#profileLink").click(function(){
		//강제로 <input type="file" /> 을 클릭해서 파일 선택창을 띄우고
		$("#profileImage").click();		//나머지 폼은 css로 숨김.
	});
	//input type="file" 에 파일이 선택되면 
	$("#profileImage").on("change", function(){
		//폼을 강제 제출하고(submit 버튼이 없어도 제출이 되고, 페이지 전환이 없다.)
		$("#profileForm").submit();
	})
	// jquery form 플러그인의 동작을 이용해서 폼이 ajax로 제출되로록 한다.(페이지 전환없이 비동기로 제출하겠다는 뜻)... (ajax는 원래 없기 때문에 js를 따로 플러그인 해주고 사용하는 함수)
	$("#profileForm").ajaxForm(function(responseData){
		//responseData 는 plain object 이다.
		//{savePath:"/upload/저장된이미지파일명"}
		//savedPath 라는 방에 저장된 이미지의 경로가 들어있다.
		console.log(responseData);	//ajax요청에 대한 응답이 들어온다.
		var src="${pageContext.request.contextPath }"+responseData.savedPath;
		//img 의 src 속성에 반영함으로써 이미지가 업데이트 되도록 한다.
		$("#profileLink img").attr("src", src);
	});
	
	function deleteConfirm(){
		var isDelete=confirm("<%=id%> 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>