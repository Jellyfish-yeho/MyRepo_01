<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get방식 파라미터 url이라는 이름으로 전달되는 값이 있는지 읽어와 본다. 
	String url=request.getParameter("url");
	//만일 넘어오는 값이 없다면
	if(url==null){
		//로그인 후에 index.jsp 페이지로 갈 수 있도록 절대 경로를 구성한다.
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/loginform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.bd-placeholder-img{
		font-size : 1.125rem;
		text-anchor : middle;
		-webkit-user-select : none;
		-moz-user-select:none;
		user-select:none;
	}
	@media (min-width:768px){
		.bd-placeholder-img-lg{
			font-size:3.5rem;
		}
	}
</style>
<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<main class="form-signin">
		<form action="login.jsp" method="post">
		<img class="mb-4" src="../BerryBerry.png" alt="" width="100"/>
		
		<h1 class="h3 mb-3 fw-normal">Log-in</h1>
		
			<%-- 로그인 후에 이동할 목적지 정보를 url이라는 파라미터 명으로 전송될 수 있도록 한다. --%>
			
			<input type="hidden" name="url" value="<%=url%>" />
			<div class="form-floating">				
				<input class="form-control" type="text" name="id" id="id" />
				<label for="id">id</label>
			</div>
			<div class="form-floating">				
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<label for="pwd">password</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary" type="submit">login</button>
		</form>
		

	</main>
</body>
</html>