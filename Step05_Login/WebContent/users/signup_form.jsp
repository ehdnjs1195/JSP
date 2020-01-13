<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signupform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>회원가입 페이지</h1>
	<form action="signup.jsp" method="post" id="signupForm">
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" name="id" />
			<button id="checkBtn">중복확인</button>		<!-- form 안에 버튼을 넣으면 default로 제출이 되어 버린다. 우선 제출이 되는 것을 막아야 한다. -->
			<span id="checkResult"></span>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="pwd"/>
		</div>
		<div>
			<label for="pwd2">비밀번호 확인</label>
			<input type="password" id="pwd2" name="pwd2"/>
			<span id="pwdCheck"	></span>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" id="email" name="email" />
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</div>
<script>
	//아이디의 유효성 여부를 확인할 변수.
	var isIdValid=false;

	//중복확인 버튼을 눌렀을 때 실행할 함수 등록
	$("#checkBtn").on("click", function(){
		//1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부를 응답받는다. (페이지 이동없이 자바스크립트로 원하는 시점에 요청을 하는 작업. 요청과 함께 파라미터를 전달.  	지금 까지는 링크를 누르거나 submit 버튼을 눌러서 요청을 해왔었다.)
		$.ajax({	//object를 전달.  key:value, key:value ... 전달.
			url:"${pageContext.request.contextPath }/users/checkid.jsp",		//요청 url
			method:"GET",	//요청 메소드
			data:{inputId:inputId},		//data라는 방에 요청 할 때 요청파라미터를 전달(콤마로 여러개의 파라미터를 전달). inputId라는 파라미터 명으로 inputId 값을 전달. (checkid.jsp?inputId=inputId 가 된다.)
			success:function(responseData){		//응답이 되면(버튼을 누르면) 이 funcion이 호출된다. 응답한 인자로 responseData가 전달된다. jsp 문자열 전체가 전달된다.
				console.log(responseData);	//콘솔로그로 확인 가능.
				if(responseData.isExist){//아이디가 이미 존재하는 경우(사용불가)
					$("#checkResult").text("사용불가").css("color","red");
					isIdValid=false;
				}else{ //아닌경우(사용가능)
					$("#checkResult").text("사용가능").css("color","green");
					isIdValid=true;
				}
			}
		});		//이렇게 요청을 하고도 페이지 전환 없이 응답하는 것을 ajax 통신이라 한다. (비동기 통신. 요청하고 응답이 오면 success 함수를 호출하고 끝.) =>보통 ajax 요청에 대한 응답은 xml,json 형식으로 한다.
		return false; //폼 전송 막기
	});
	
	// 폼에 제출 이벤트가 발생했을 때 실행할 함수 등록
	$("#signupForm").on("submit", function(){		//제출 버튼을 눌렀을 때 실행순서가 이 안으로 들어온다.
		//폼의 유효성 검증을 하고 만일 통과를 못하면 폼 제출을 막는다.
		
		//1. 아이디 유효성 검증
		if(!isIdValid){	
			//잘못되었다는 메세지를 띄우고
			alert("아이디 중복확인을 하세요!");
			//잘못된 곳을 바로 입력할 수 있도록 포커스 주기
			$("#id").focus();	
			return false;	//폼 제출 막기	(폼 유효성 검증과정.)
		}
		
		//2. 비밀번호 유효성 검증
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		if(pwd != pwd2){
			alert("비밀번호를 확인 하세요!");
			$("#pwdCheck").text("비밀번호를 확인하세요").css("color","red");
			$("#pwd").focus();
			return false;
		}
		
		//3. 이메일 유효성 검증
		var email=$("#email").val();
		// @ 가 포함되어 있는지 확인한다. 만일 포함되어 있지 않으면 null 이 리턴된다.
		var emailValid=email.match("@");	// @가 포함되어 있는지 체크함.
		if(emailValid == null){
			alert("이메일 형식에 맞게 입력하세요!");
			$("#email").focus();
			return false;
		}
	});
</script>
</body>
</html>