<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session 영역에서 로그인 된 아이디를 읽어온다.
	String id=(String)session.getAttribute("id");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="include/navbar.jsp"></jsp:include>
	
	<div class="container mt-4 mb-4">
		<h1>Hello, World!</h1>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
		 		<div class="carousel-item active">
					<img src="myWebsImg/dontcallme1.jpg" class="d-block w-100" >
				</div>
				<div class="carousel-item">
					<img src="myWebsImg/dontcallme2.jpg" class="d-block w-100" >
				</div>
				<div class="carousel-item">
					<img src="myWebsImg/dontcallme3.jpg" class="d-block w-100" >
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
	</div>
<%
	//쿠키 읽어오기
	Cookie[] cookies=request.getCookies();
	//팝업을 띄울지 여부
	boolean isPopup=true;
	if(cookies != null){
		//반복문 돌면서 저장된 쿠키를 얻어내서
		for(Cookie tmp:cookies){
			//isPopup이라는 이름으로 저장된 쿠키가 있으면
			if(tmp.getName().equals("isPopup")){
				//팝업을 띄우지 않게 한다.
				isPopup=false;
			}
		}
	}
%>
<%if(isPopup){%>
	<script>
		/*
			[ 팝업창 띄우기 ]
		
			window 객체의 .open() 함수를 이요해서 팝업창을 띄울 수 있다. 
			
			.open( 띄울 페이지, 제목(동작 안함), 옵션 )
		*/
		window.open("sale.jsp","창의제목","width=400,height=400,top=100,left=100");
	</script>
<%}%>
</body>
</html>





