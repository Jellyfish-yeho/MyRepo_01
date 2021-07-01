<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="../include/navbar.jsp"></jsp:include>

</head>
<body>
	<div class="container mt-3 mb-5">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb">
			    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">Index</a></li>
			    <li class="breadcrumb-item active" aria-current="page">Sign up</li>
		  </ol>
		</nav>
		
		<form action="signup.jsp" method="post">
			<div class="form-group">
				<label for="nick" class="form-label">닉네임</label>
				<input type="text" class="form-control" name="nick" id="nick"/>
			</div>
			
		<fieldset>
			<legend>이메일 수신 여부</legend>
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="email" id="email1" value="yes"/>
				<label for="email1" class="form-check-label">네</label>
			</div>
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="email" id="email2" value="no"/>
				<label for="email2" class="form-check-label">아니오</label>
			</div>
		</fieldset>	
			
		<div class="list-group radio-list-group mb-4">
			<span class="input-group-text">Email Reception 2</span>
			<div class="list-group-item">					
				<label>
					<input type="radio" name="email2" value="yes"/>
					<span class="list-group-item-text">Yes</span>
				</label>
				<label>
					<input type="radio" name="email2" value="no"/>
					<span class="list-group-item-text">No</span>
				</label>				
			</div>
		</div>	
				
		<div class="form-group">
			<label class="form-label" for="concern">관심사</label>
			<select class="form-select" name="concern">
				<option value="">Choose</option>
				<option value="game">game</option>
				<option value="movie">movie</option>
				<option value="etc">etc</option>
			</select>
		</div>
		
		<fieldset>
			<legend>배우고 싶은 언어 체크</legend>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" name="language" id="lan1" value="Java" />
				<label class="form-check-label" for="lan1">자바</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" name="language" id="lan2" value="Python" />
				<label class="form-check-label" for="lan2">파이썬</label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="checkbox" name="language" id="lan3" value="C++" />
				<label class="form-check-label" for="lan3">C++</label>
			</div>
		</fieldset>

		<div class="form-group">
			<label class="form-label" for="comment">남기고 싶은 말</label>
			<textarea class="form-control" name="comment" id="comment" cols="30" rows="10"></textarea>
		</div>
			<button class="btn btn-primary mb-4" type="submit">sign-up</button>
		</form>

	</div>
</body>
</html>