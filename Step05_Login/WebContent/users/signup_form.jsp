<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signupform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/step03_custom.css" />
<style>
	/*페이지 로딩 시점에 도움말과 피드백 아이콘은 일단 숨기기*/
	.help-block, .form-control-feedback{
		display: none;
	}
</style>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
	<h1>회원가입 페이지</h1>
	<form action="signup.jsp" method="post" id="signupForm">
		<div class="form-group has-feedback">
			<label class="control-label" for="id">아이디</label>
			<input class="form-control" type="text" id="id" name="id" />
			<p class="help-block" id="msg_notuse" >사용 불가능한 아이디 입니다.</p>
			<p class="help-block" id="msg_null" >반드시 입력해 주세요!!</p>
			<span  class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span  class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		
		<div class="form-group has-feedback">
			<label class="control-label" for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
			<p class="help-block" id="msg_pwdCheck" >비밀번호를 확인하세요!!</p>
			<span  class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span  class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<div class="form-group">
			<label class="control-label" for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" name="pwd2"/>
			<span id="pwdCheck"	></span>
		</div>
		<div class="form-group has-feedback">
			<label class="control-label" for="email">이메일</label>
			<input class="form-control" type="email" id="email" name="email" />
			<p class="help-block" id="msg_emailCheck" >이메일 형태로 작성하세요!!</p>
			<span  class="glyphicon glyphicon-remove form-control-feedback"></span>
			<span  class="glyphicon glyphicon-ok form-control-feedback"></span>
		</div>
		<button type="submit">가입</button>
		<button type="reset">취소</button>
	</form>
</div>
<script>
	//아이디의 유효성 여부를 확인할 변수.
	var isIdValid=false;

	//아이디를 입력할 때 실행할 함수 등록(입력할 때 마다 함수 실행.)
	$("#id").on("input", function(){
		//1. 입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//2. 서버에 보내서 사용가능 여부를 응답받는다. (페이지 이동없이 자바스크립트로 원하는 시점에 요청을 하는 작업. 요청과 함께 파라미터를 전달.  	지금 까지는 링크를 누르거나 submit 버튼을 눌러서 요청을 해왔었다.)
		$.ajax({	//object를 전달.  key:value, key:value ... 전달.
			url:"${pageContext.request.contextPath }/users/checkid.jsp",		//요청 url
			method:"GET",	//요청 메소드
			data:{inputId:inputId},		//data라는 방에 요청 할 때 요청파라미터를 전달(콤마로 여러개의 파라미터를 전달). inputId라는 파라미터 명으로 inputId 값을 전달. (checkid.jsp?inputId=inputId 가 된다.)
			success:function(responseData){		//응답이 되면(버튼을 누르면) 이 funcion이 호출된다. 응답한 인자로 responseData가 전달된다. jsp 문자열 전체가 전달된다.
				//일단 초기화 시켜놓고
				$("#id").parent().removeClass("has-success has-error").find(".form-control-feedback").hide(); 	//#id 요소의 부모요소 선택. class 지우고, form-control-feedback 모두 찾아서 숨기기.
				console.log(responseData);								//find 자손요소 중에서 클래스명이 xxx인것 찾기. 찾아서 숨기기.
				if(responseData.isExist){//아이디가 이미 존재하는 경우(사용불가)
					//색상을 빨간색으로
					$("#id").parent().addClass("has-error").find(".glyphicon-remove").show();
					//에러메세지 보이게
					$("#msg_notuse").show();
					//상태 바꾸기
					isIdValid=false;
				}else{ //아닌경우(사용가능)	
					//색상을 초록색으로
					$("#id").parent().addClass("has-success").find(".glyphicon-ok").show();
					//에러메세지 안보이게
					$("#msg_notuse").hide();
					if(responseData.isNull){
						$("#id").parent().addClass("has-error").find(".glyphicon-remove").show();
						$("#id").parent().find(".glyphicon-ok").hide();
						$("#msg_null").show();
					}else{
						$("#id").parent().addClass("has-success").find(".glyphicon-ok").show();
						$("#msg_null").hide();
					}
					//상태 바꾸기
					isIdValid=true;
				}
			}
		});		//이렇게 요청을 하고도 페이지 전환 없이 응답하는 것을 ajax 통신이라 한다. (비동기 통신. 요청하고 응답이 오면 success 함수를 호출하고 끝.) =>보통 ajax 요청에 대한 응답은 xml,json 형식으로 한다.
		//폼 전송은 막을 필요가 없다.
	});
	
	//비밀번호 확인
	var pwdEqual=false;
	var c=$("#pwd2").on("input",function(){
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		$("#pwdCheck").hide();
		$("#pwd").parent().removeClass("has-success has-error").find(".form-control-feedback").hide();	//초기화
		if(pwd != pwd2){
			$("#pwd").parent().addClass("has-error").find(".glyphicon-remove").show();
			$("#msg_pwdCheck").show();
			pwdEqual=false;
			return pwdEqual;
		}else{
			$("#pwd").parent().addClass("has-success").find(".glyphicon-ok").show();
			$("#msg_pwdCheck").hide();
			pwdEqual=true;
			return pwdEqual;
		}
	});
	$("#pwd").on("input",function(){
		var pwd=$("#pwd").val();
		var pwd2=$("#pwd2").val();
		$("#pwdCheck").hide();
		$("#pwd").parent().removeClass("has-success has-error").find(".form-control-feedback").hide();	//초기화
		if(pwd != pwd2){
			$("#pwd").parent().addClass("has-error").find(".glyphicon-remove").show();
			$("#msg_pwdCheck").show();
			pwdEqual=false;
			return pwdEqual;
		}else{
			$("#pwd").parent().addClass("has-success").find(".glyphicon-ok").show();
			$("#msg_pwdCheck").hide();
			pwdEqual=true;
			return pwdEqual;
		}
	});
	
	//이메일 형식 확인
	$("#email").on("input", function(){
		var email=$("#email").val();
		var emailValid=email.match("@");	// @가 포함되어 있는지 체크함.
		$("#email").parent().removeClass("has-success has-error").find(".form-control-feedback").hide();
		if(emailValid == null){
			$("#email").parent().addClass("has-error").find(".glyphicon-remove").show();
			$("#msg_emailCheck").show();
		}else{
			$("#email").parent().addClass("has-success").find(".glyphicon-ok").show();
			$("#msg_emailCheck").hide();
		}
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
		if(!pwdEqual){
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