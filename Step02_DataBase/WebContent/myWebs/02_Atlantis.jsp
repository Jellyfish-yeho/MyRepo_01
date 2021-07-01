<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<jsp:include page="/myWebs/style.jsp"></jsp:include>
<style>
	#albumImg{

	    margin: 0 auto;
	}
	.box{
		border-color : #79E5CB;
		!important;
	}
</style>
</head>
<body>
	<jsp:include page="/myWebs/navbar.jsp"></jsp:include>
	<!-- top button -->
	<div class="sticky-top ml-3">
		<button onclick="topFunction()"  class="btn btn-border-success float-end">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-up-fill" viewBox="0 0 16 16">
				<path d="m7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z"/>
			</svg>
		</button>
	</div>	
	<!-- container -->
	<div id="content" class="container mb-4">
		<div class="row">
			<div id="albumImg" class="col-7 col-sm-7">
				<img src="../myWebsImg/atlantis02.jpg" />
			</div>
			<div class="col-5 col-sm-5">
				<div class="row mb-3">
					<h5 class="text-muted">SHINee</h5>
				</div>
				<div class="row box border-3 border-bottom mb-2">
					<h2>The 7th Repackage Album : 'Atlantis'</h2>
				</div>
				<div class="row box border-bottom mb-4">
					<div class="col-3 col-">
						<span class="fs-4 bold">\99,999 </span>
					</div>
					<div class="col-3">
						<span class="fs-5 text-decoration-line-through text-muted"> 999,999 </span>
					</div>
					<div class="col-2">
						<span class="fs-5 fw-bold text-danger"> 90%</span>
					</div>
					<div class="col-4"></div>					
				</div>
				<div class="row">
				
				
					<button class="btn btn-info">Buy Now</button>
					
					
				</div>
				<div class="row">
					<div class="col">
					
					</div>
					<button class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal1">Add to Cart</button>
						<!-- Modal -->
						<div class="modal fade" id="exampleModal1" tabindex="-1">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Notice</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        Successfully added to your cart.
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
					<button class="btn btn-outline-secondary">Add to Wish List</button>			
				</div>				
			</div>			
		</div>
		
	
	
	</div>	
</body>
</html>