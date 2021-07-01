<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/util.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.box{
		width: 100px;
		height: 100px;
		display : inline-block;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>utility test</h1>
		
		<h2>background color</h2>
		<div class="bg-primary text-white">bg-primary</div>
		<div class="bg-success text-white my-1 p-3">bg-success</div>		
		<div class="bg-info">bg-info</div>
		<div class="bg-primary bg-gradient text-white">bg-primary</div>
		<div class="bg-success bg-gradient text-white">bg-success</div>	
		
		<h2>borderline</h2>	
		<div class="box border border-primary bg-light"></div>
		<div class="box border-top border-success bg-light"></div>
		<div class="box border-end border-info border-2 bg-light"></div>
		<div class="box border-bottom border-info border-3 bg-light"></div>
		<div class="box border border-primary bg-light rounded"></div>
		<div class="box border border-primary bg-light rounded-circle"></div>
		<br />
		<img src="../images/kim1.png" class="box bg-light border border-primary rounded-circle" />
	</div>
</body>
</html>