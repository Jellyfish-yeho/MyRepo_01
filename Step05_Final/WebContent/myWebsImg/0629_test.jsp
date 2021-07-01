<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="alert alert-danger">
	삭제 했습니다
	</div>
<button class="btn btn-outline-success">전송</button>
<nav>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">home</a></li>
		<li class="breadcrumb-item"><a href="#">game</a></li>
		<li class="breadcrumb-item active" aria-current="page">study</li>
	</ol>
</nav>

<form>
	<div>
		<label for="email" class="form-label">email</label>
		<input type="text" class="form-control" id="email">
	</div>
</form>

<form>
	<div>
		<label for="email2" class="form-label">email</label>
		<input type="text" class="form-control is-invalid" id="email2">
		<div class="invalid-feedback">형식이 달라요</div>
	</div>
</form>

</body>
</html>