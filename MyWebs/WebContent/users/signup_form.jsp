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
		<h1>부대 가입하기</h1>
		<form action="signup.jsp" method="post" id="signupForm">
			<div>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" />
			</div>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd" id="pwd" />
			</div>		
			<button type="submit">가입</button>
		</form>
	</div>
</body>
</html>