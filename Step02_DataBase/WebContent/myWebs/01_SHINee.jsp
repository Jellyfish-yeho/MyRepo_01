<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>/myWebs/01_SHINee.jsp</title>
	<jsp:include page="/myWebs/style.jsp"></jsp:include>
	<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<!-- navbar -->
	<jsp:include page="/myWebs/navbar.jsp"></jsp:include>
	<jsp:include page="/myWebs/topButton.jsp"></jsp:include>
	<!-- container -->
	<div id="content" class="container mb-4">
	<!--  title -->
		<h1 id="shinee" class="text-center">
			SHINee is Back
		</h1>

		<!-- sub title -->
		<h3 id="shinee" class="text-center mt-4 mb-4">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-diamond" viewBox="0 0 16 16">
				<path d="M8.384 1.226a.463.463 0 0 0-.768 0l-4.56 6.468a.537.537 0 0 0 0 .612l4.56 6.469a.463.463 0 0 0 .768 0l4.56-6.469a.537.537 0 0 0 0-.612l-4.56-6.468zM6.848.613a1.39 1.39 0 0 1 2.304 0l4.56 6.468a1.61 1.61 0 0 1 0 1.838l-4.56 6.468a1.39 1.39 0 0 1-2.304 0L2.288 8.92a1.61 1.61 0 0 1 0-1.838L6.848.613z"/>
			</svg>
			7th Album : Don7t Call Me
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-diamond" viewBox="0 0 16 16">
				<path d="M8.384 1.226a.463.463 0 0 0-.768 0l-4.56 6.468a.537.537 0 0 0 0 .612l4.56 6.469a.463.463 0 0 0 .768 0l4.56-6.469a.537.537 0 0 0 0-.612l-4.56-6.468zM6.848.613a1.39 1.39 0 0 1 2.304 0l4.56 6.468a1.61 1.61 0 0 1 0 1.838l-4.56 6.468a1.39 1.39 0 0 1-2.304 0L2.288 8.92a1.61 1.61 0 0 1 0-1.838L6.848.613z"/>
			</svg>
		</h3>
		<!-- carousel : 5 pics -->
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></button>				
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></button>								
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../myWebsImg/dontcallme1.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../myWebsImg/shinee01.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../myWebsImg/dontcallme2.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../myWebsImg/dontcallme3.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<img src="../myWebsImg/dontcallme4.jpg" class="d-block w-100">
				</div>
				<div class="carousel-item">
					<div class="ratio ratio-16x9">
						<iframe src="https://www.youtube.com/embed/p6OoY6xneI0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<!-- cards : 4 mems  -->
		<div id="membersContent">
			<h3 id="shinee" class="text-center mt-4 mb-4">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-diamond" viewBox="0 0 16 16">
					<path d="M8.384 1.226a.463.463 0 0 0-.768 0l-4.56 6.468a.537.537 0 0 0 0 .612l4.56 6.469a.463.463 0 0 0 .768 0l4.56-6.469a.537.537 0 0 0 0-.612l-4.56-6.468zM6.848.613a1.39 1.39 0 0 1 2.304 0l4.56 6.468a1.61 1.61 0 0 1 0 1.838l-4.56 6.468a1.39 1.39 0 0 1-2.304 0L2.288 8.92a1.61 1.61 0 0 1 0-1.838L6.848.613z"/>
				</svg>
				Members
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-diamond" viewBox="0 0 16 16">
					<path d="M8.384 1.226a.463.463 0 0 0-.768 0l-4.56 6.468a.537.537 0 0 0 0 .612l4.56 6.469a.463.463 0 0 0 .768 0l4.56-6.469a.537.537 0 0 0 0-.612l-4.56-6.468zM6.848.613a1.39 1.39 0 0 1 2.304 0l4.56 6.468a1.61 1.61 0 0 1 0 1.838l-4.56 6.468a1.39 1.39 0 0 1-2.304 0L2.288 8.92a1.61 1.61 0 0 1 0-1.838L6.848.613z"/>
				</svg>	
			</h3>
			<div class="row row-cols-1 row-cols-md-4 g-4">
				<div class="col">
					<div class="card h-100">
						<img src="../myWebsImg/onew01.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">Onew</h5>
							<p class="card-text">Lee Jin Ki</p>
						</div>
					</div>
				</div>
				<div class="col">
				    <div class="card h-100">
						<img src="../myWebsImg/minho01.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">Minho</h5>
							<p class="card-text">Choi Min Ho</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="../myWebsImg/key01.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">Key</h5>
							<p class="card-text">Kim Ki Bum</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<img src="../myWebsImg/taemin01.jpg" class="card-img-top">
						<div class="card-body">
							<h5 class="card-title">Taemin</h5>
							<p class="card-text">Lee Tae Min</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- join us -->
		<h3 id="shinee" class="text-center mt-4 mb-4">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
			  <path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
			  <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
			</svg>
			Join SHINee WORLD
		</h3>
		<div class="row">
			<div class="col-sm-3 offset-sm-3">
					Support SHINee with SHINee World. 
			</div>
			<div class="col-sm-2">
				<!-- Button trigger modal -->					
				<button  type="button" class="btn btn-outline-success d-grid gap-2 d-md-flex justify-content-md-end" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button">
					  Join
				</button>				
			</div>	
			<div class="col-sm-4">
				<img src="../myWebsImg/sesu.gif" width=200px />		
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" >
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Join form</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
					        <form >
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label" placeholder="Input Email...">Email address</label>
									<input id="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="exampleInputPassword1" class="form-label" placeholder="Input Password...">Password</label>
									<input id="password" type="password" class="form-control" id="exampleInputPassword1">											
									<div id="emailHelp" class="form-text">Password should be at least 10 letters.</div>
								</div>
								<div class="mb-3 form-check">
									<input type="checkbox" class="form-check-input" id="exampleCheck1">
									<label class="form-check-label" for="exampleCheck1">I will support SHINee forever.</label>
								</div>									
							</form>
						</div>
						<div class="modal-footer">
							<button id="submitBtn" type="submit" class="btn btn-outline-success" data-bs-dismiss="modal">Submit</button>
							<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
				</div>			
			</div>
	</div><!-- container // -->

	
	
	<!-- script -->
	<script>
		document.querySelector("#submitBtn").addEventListener("click",function(){
			let email=document.querySelector("#email").value;
			let password=document.querySelector("#password").value;
			let modal=bootstrap.Modal.getInstance(document.querySelector("#exampleModal"));
			if(!email|| !password){
				alert("Please enter your email and password.");
				modal.show();
			}else{
				modal.hide();
			}
		})
		
		document.querySelector("#topBtn").addEventListener("click",function(){
			window.scrollTo(0,0);
		});
	</script>
		  
</body>
</html>







