<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myWebs/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>

</head>
<body>
<jsp:include page="../myWebs/navbar.jsp"></jsp:include>	
	<div class="container">
		<!--  signup form  -->
		<form action="signup.jsp" method="post">
			<!-- id input : text -->
			<fieldset>
					<div class="form-group">
						<label for="id" class="form-label">ID</label>
						<input type="text" class="form-control" name="id" id="id" />
					</div>				
			</fieldset>
			<!-- email reception yes/no : radio -->
			<fieldset>
				<legend>Email Reception</legend>
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="email" id="email1" value="yes" />
						<label for="email1" class="form-check-label">Yes</label>						
					</div>
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="email" id="email2" value="no" />
						<label for="email2" class="form-check-label">No</label>						
					</div>				
			</fieldset>
			<!-- SHinee를 알게 된 계기 : select -->
			<div class="form-group">
				<label class="form-label" for="how">How did you know SHINee?</label>
				<select class="form-select" name="how" id="how">
					<option value="">Choose</option>
					<option value="friend">Friend</option>
					<option value="media">Media</option>
					<option value="etc">Etc</option>
				</select>				
			</div>
			<!-- 좋아하는 멤버  : checkbox -->
			<fieldset>
				<legend>Member You Like</legend>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem1" value="onew"/>
					<label class="form-check-label" for="mem1">Onew</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem2" value="jonghyun"/>
					<label class="form-check-label" for="mem2">Jonghyun</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem3" value="minho"/>
					<label class="form-check-label" for="mem3">Minho</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem4" value="key"/>
					<label class="form-check-label" for="mem4">Key</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem5" value="taemin"/>
					<label class="form-check-label" for="mem5">Taemin</label>
				</div>
			</fieldset>
			<!-- 코멘트 : textarea -->
			<div class="form-group">
				<label class="form-label" for="comment">Comment</label>
				<textarea class="form-control" name="comment" id="comment" cols="30" rows="10"></textarea>
			</div>
			<button class="btn btn-sm btn-outline-success" type="submit">Sign up</button>
		</form>
		
	
	
	</div>

</body>
</html>