<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form_validation.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<form action="">
		<div>
			<label for="" class="form-label">id</label>
			<input id="one" type="text" class="form-control"/>
			<div class="valid-feedback">
				good
			</div>
		</div>
		<div>
			<label for="" class="form-label"></label>
			<input type="text" class="form-control" />
			<div class="invalid-feedback">
				bad
			</div>
		</div>
		<div>
			<label for="" class="form-label">id</label>
			<input type="text" class="form-control is-valid"/>
			<div class="valid-feedback">
				good
			</div>
		</div>
		<div>
			<label for="" class="form-label"></label>
			<input type="text" class="form-control is-invalid" />
			<div class="invalid-feedback">
				bad
			</div>
		</div>
	
	</form>
</div>	
</body>
</html>














