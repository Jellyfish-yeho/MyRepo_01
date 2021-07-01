<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<h1>Signup Form</h1>
		<form action="signup.jsp" method="post" id="myForm">
			<div>
				<label class="control-label" for="id">id</label>
				<input class="form-control" type="text" name="id" id="id" />
				<small class="form-text">id must start with small letter and be within 5~10 letters.</small>
				<div class="invalid-feedback">
					Cannot use this id. 
				</div>
			</div>
			<div>
				<label class="control-label" for="pwd">password</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<small class="form-text text-muted">password must be within 5~10 letters.</small>
				<div class="invalid-feedback">
					Cannot use this password.
				</div>
			</div>
			<div>
				<label class="control-label" for="pwd2">password check</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>				
			</div>
			<div>
				<label class="control-label" for="email">email</label>
				<input class="form-control" type="text" name="email" id="email" />
				<div class="invalid-feedback">
					check email matches format.
				</div>
			</div>
			<button class="btn btn-primary btn-sm" type="submit">signup</button>
		</form>
	</div>
	<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
	<script>
		//아이디, 비밀번호, 이메일의 유효성 여부를 관리할 변수를 만들고 초기값 대입
		let isIdValid=false;
		let isPwdValid=false;
		let isEmailValid=false;
	
		//id 를 입력했을 때 (input) 실행할 함수 등록
		//input : 입력할 때마다 전송, blur : focus를 잃으면 전송
		document.querySelector("#id").addEventListener("input",function(){
			//우선 is-invalid, is-valid 클래스를 제거한다
			﻿document.querySelector("#id").classList.remove("is-invalid");
			﻿document.querySelector("#id").classList.remove("is-valid");		
			//1. 입력한 아이디 value값 읽어오기
//			let inputId=document.querySelector("#id").value;
			let inputId=this.value;
			//입력할 아이디를 검증할 정규표현식
			const reg_id=/^[a-z].{4,9}$/;
			//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
			if(!reg_id.test(inputId)){
				
				isIdValid=false; //아이디가 매칭되지 않는다고 표시하고
				﻿document.querySelector("#id").classList.add("is-invalid");
				return; //함수를 여기서 끝낸다 (ajax 전송되지 않도록)
			}
			
			ajaxPromise("checkid.jsp","get","inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//data는 {isExist:true} or {isExist:false} 형태의 object이다. 
				if(data.isExist){ //만일 존재한다면
					//사용할 수 없는 아이디라는 피드백을 보이게 한다.					
					isIdValid=false;
					﻿document.querySelector("#id").classList.add("is-invalid");
				}else{//존재하지 않으면
					//피드백 숨기기					
					isIdValid=true;
					﻿document.querySelector("#id").classList.add("is-valid");
				}
			});
		});
		
		//비밀번호를 확인하는 함수
		function checkPwd(){
			document.querySelector("#pwd").classList.remove("is-invalid");
			document.querySelector("#pwd").classList.remove("is-valid");
			const pwd=document.querySelector("#pwd").value;
			const pwd2=document.querySelector("#pwd2").value;
			//최소 5글자 최대 10글자인지를 검증할 정규표현식
			const reg_pwd=/^.{5,10}$/;
			if(!reg_pwd.test(pwd)){
				isPwdValid=false;
				document.querySelector("#pwd").classList.add("is-invalid");
				return;
			}	
			if(pwd!=pwd2){//비밀번호와 비밀번호 확인란이 다르면
				//비밀번호를 잘못 입력한 것이다.
				isPwdValid=false;
				document.querySelector("#pwd").classList.add("is-invalid");
			}else{
				isPwdValid=true;
				document.querySelector("#pwd").classList.add("is-valid");
			}
		}
		//비밀번호 입력란에 input 이벤트가 일어났을 때 실행할 함수 등록
		document.querySelector("#pwd").addEventListener("input",checkPwd);
		document.querySelector("#pwd2").addEventListener("input",checkPwd);
		
		//이메일을 입력했을 때 실행할 함수 등록
		document.querySelector("#email").addEventListener("input",function(){
			document.querySelector("#email").classList.remove("is-valid");
			document.querySelector("#email").classList.remove("is-invalid");
			//1. 입력한 이메일을 읽어와서
			const inputEmail=this.value;
			//2. 이메일을 검증할 정규표현식 객체를 만들어서
			const reg_email=/@/;
			//3. 정규표현식 매칭 여부에 따라 분기하기
			if(reg_email.test(inputEmail)){//만일 매칭된다면				
				isEmailValid=true;
				document.querySelector("#email").classList.add("is-valid");
			}else{
				isEmailValid=false;
				document.querySelector("#email").classList.add("is-invalid");
			}
		});
	
		document.querySelector("#myForm").addEventListener("submit",function(e){
			/*
				입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효하지 않으면
				e.preventDefault(); 가 수행되도록 해서 폼 제출을 막는다. 
			*/
			//폼 전체의 유효성 여부 알아내기
			let isFormValid=isIdValid && isPwdValid && isEmailValid;
			if(!isFormValid){//폼이 유효하지 않으면 = isFormValid==false
				//폼 전송 막기
				e.preventDefault();
			}
		});
	</script>
</body>
</html>

