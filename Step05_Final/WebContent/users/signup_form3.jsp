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
	<form v-on:submit="onFormSubmit"
			action="signup.jsp" method="post" id="myForm">
		<div>
			<label class="control-label" for="id">id</label>
			<input v-on:input="onIdInput" 
					v-model="id" 
					v-bind:class="{'is-valid':isIdValid,'is-invalid':!isIdValid && isIdDirty}"
					class="form-control" type="text" name="id" id="id" />
			<small class="form-text">id must start with small letter and be within 5~10 letters.</small>
			<div class="invalid-feedback">
				Cannot use this id. 
			</div>
		</div>
		<div>
			<label class="control-label" for="pwd">password</label>
			<input v-model="pwd" 
					v-bind:class="{'is-valid':isPwdValid,'is-invalid':!isPwdValid && isPwdDirty}"
					v-on:input="checkPwd" 
			class="form-control" type="password" name="pwd" id="pwd"/>
			<small class="form-text text-muted">password must be within 5~10 letters.</small>
			<div class="invalid-feedback">
				Cannot use this password.
			</div>
		</div>
		<div>
			<label class="control-label" for="pwd2">password check</label>
			<input v-model="pwd2" 
					v-on:input="checkPwd" 
			class="form-control" type="password" name="pwd2" id="pwd2"/>				
		</div>
		<div>
			<label class="control-label" for="email">email</label>
			<input v-model="email"
					v-on:input="onEmailInput" 
					v-bind:class="{'is-valid':isEmailValid,'is-invalid':!isEmailValid && isEmailDirty}"
			class="form-control" type="text" name="email" id="email" />
			<div class="invalid-feedback">
				check email matches format.
			</div>
		</div>
		<button	class="btn btn-primary btn-sm" type="submit">signup</button>
	</form>
</div>
<script src="<%=request.getContextPath() %>/js/gura_util.js"></script>
<!-- vue.js 로딩하기  -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
    let app=new Vue({
        el: "#myForm",
        data: {
        	isIdValid:false,
        	isPwdValid:false,
        	isEmailValid:false,
        	id:"",
        	pwd:"",
        	pwd2:"",
        	email:"",
        	isIdDirty:false,
        	isPwdDirty:false,
        	isEmailDirty:false
        },
        methods:{ 
        	onFormSubmit:function(e){
        		//폼 전체의 유효성 여부 알아내서 모델에 대입하기
        		isFormValid=this.isIdValid && this.isPwdValid && this.isEmailValid;
        		if(!isFormValid){//폼이 유효하지 않으면 = isFormValid==false
        			//폼 전송 막기
        			e.preventDefault();
        		}
        	},
        	onEmailInput:function(){
        		//이메일을 한번이라도 입력하면
        		this.isEmailDirty=true;
        		//2. 이메일을 검증할 정규표현식 객체를 만들어서
        		const reg_email=/@/;
        		//3. 정규표현식 매칭 여부에 따라 분기하기
        		if(reg_email.test(this.email)){//만일 매칭된다면				
        			this.isEmailValid=true;
        		}else{
        			this.isEmailValid=false;
        		}
        	},
        	checkPwd:function(){
        		//비밀번호를 한번이라도 입력하면
        		this.isPwdDirty=true;
        		//모델 값을 읽어온다
        		const pwd=this.pwd;
        		const pwd2=this.pwd2;
        		//최소 5글자 최대 10글자인지를 검증할 정규표현식
        		const reg_pwd=/^.{5,10}$/;
        		if(!reg_pwd.test(pwd)){
        			//모델 값을 수정한다
        			this.isPwdValid=false;
        			return; //함수를 여기서 종료
        		}	
        		if(pwd!=pwd2){//비밀번호와 비밀번호 확인란이 다르면
        			//비밀번호를 잘못 입력한 것이다.
        			this.isPwdValid=false;
        		}else{
        			this.isPwdValid=true;
        		}
        	},
        	onIdInput:function(){
        		//아이디를 한번이라도 입력하면
        		this.isIdDirty=true;
        		//아이디 읽어오기
        		let inputId=this.id;
        		//입력할 아이디를 검증할 정규표현식
        		const reg_id=/^[a-z].{4,9}$/;
        		//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
        		if(!reg_id.test(inputId)){        			
        			this.isIdValid=false; //아이디가 매칭되지 않는다고 표시하고
        			return; //함수를 여기서 끝낸다 (ajax 전송되지 않도록)
        		}        
        		//app의 참조값을 me에 담아 놓고
        		const me = this;
        		
        		ajaxPromise("checkid.jsp","get","inputId="+inputId)
        		.then(function(response){
        			return response.json();
        		})
        		.then(function(data){
        			//data는 {isExist:true} or {isExist:false} 형태의 object이다. 
        			if(data.isExist){ //만일 존재한다면
        				/*
        					this는 Promise 객체를 가리키기 때문에 me를 사용한다. 
        				*/		
        				me.isIdValid=false;
        			}else{				
        				me.isIdValid=true;
        			}
        		});
        	}
        }
    });

</script>
</body>
</html>

