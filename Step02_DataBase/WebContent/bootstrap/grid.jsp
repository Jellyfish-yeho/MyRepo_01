<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/grid.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.col, .row > div{
		border: 1px dotted red;
	}
</style>
</head>
<body>
	<div class="container-fluid border border-primary">
		<h1>.container-fluid</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
			<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
			<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
		<h2>모든 영역에 대해서 한 줄에 4개의 칼럼으로 구성하기</h2>
		<div class="row">
			<div class="col">
				<img class="img-fluid" src="../images/image1.png" />
			</div>	
				<div class="col">
				<img class="img-fluid" src="../images/image2.png" />
			</div>
				<div class="col">
				<img class="img-fluid" src="../images/image3.png" />
			</div>
				<div class="col">
				<img class="img-fluid" src="../images/image4.png" />
			</div>	
		</div>
		<h2>특정 영역에서의 칼럼의 폭을 변화시키기1</h2>
		<div class="row">
			<!--  col-sm-6은 device 폭이 576px 이상에서 6/12의 크기, 즉 50%의 width 를 갖는다.  -->
			<div class="col-sm-6">
				<img class="img-fluid" src="../images/image1.png" />
			</div>	
				<div class="col-sm-6">
				<img class="img-fluid" src="../images/image2.png" />
			</div>
				<div class="col-sm-6">
				<img class="img-fluid" src="../images/image3.png" />
			</div>
				<div class="col-sm-6">
				<img class="img-fluid" src="../images/image4.png" />
			</div>	
		</div>
		<h2>특정 영역에서의 칼럼의 폭을 변화시키기2</h2>
		<div class="row">
			<!--  
				col-sm-6은 device 폭이 576px 이상에서 6/12의 크기, 즉 50%의 width를 갖는다. 
				col-lg-3은 device 폭이 992px 이상에서 3/12의 크기, 즉 25%의 width를 갖는다. 
			 -->
			<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image1.png" />
			</div>	
				<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image2.png" />
			</div>
				<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image3.png" />
			</div>
				<div class="col-sm-6 col-lg-3">
				<img class="img-fluid" src="../images/image4.png" />
			</div>	
		</div>
	</div>
	<div class="container border border-secondary">
		<h1>.container</h1>
		<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
			<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
				<div class="row">
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
			<div class="col">col</div>
		</div>
	</div>
</body>
</html>