<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//한글 안 깨지게 인코딩
	request.setCharacterEncoding("utf-8");
	//<input type="text" name="nick" /> 에 입력한 문자열 읽어오기
	String nick=request.getParameter("nick");
	/*
		<label>
			<input type="radio" name="email" value="yes" checked/> 네
		</label>
		<label>
			<input type="radio" name="email" value="no" /> 아니요
		</label>			
	*/
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	/*
		<select name="concern">
			<option value="">선택</option>
			<option value="game">게임</option>
			<option value="movie">영화</option>
			<option value="etc">기타</option>
		</select>	

	*/
	String concern=request.getParameter("concern");
	/*
		<label>
			<input type="checkbox" name="language" value="Java"/> 자바
		</label>
		<label>
			<input type="checkbox" name="language" value="Python"/> 파이선
		</label>
		<label>
			<input type="checkbox" name="language" value="C++"/> C++
		</label>
	
	*/
	String[] language = request.getParameterValues("language");
	
	/* 
		<textarea name="comment" cols="30" rows="10"></textarea>
	*/
	String comment=request.getParameter("comment");
	
	System.out.println("nick:"+nick);
	System.out.println("email:"+email1);
	System.out.println("email2:"+email2);
	System.out.println("concern:"+concern);
	String data="";
	if(language!=null){
		System.out.println("language.length:"+language.length);
		for(String tmp:language){
			System.out.println(tmp);
			data = data + tmp + "/";
		}
	}	
	System.out.println("comment:"+comment);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
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
	
		<h1 class="mb-4">Your Information</h1>
		<form action="signup.jsp" method="post">
			<div class="input-group mb-4">
				<span class="input-group-text">Nickname</span>
				<input type="text" class="form-control" placeholder="Enter your name..." name="nick" value="<%=nick %>" />
			</div>
			
			<div class="list-group radio-list-group mb-4">
				<span class="input-group-text">Email Reception 1</span>
				<div class="list-group-item">					
					<label>
						<input type="radio" name="email" value="yes" <%= email1.equals("yes")? "checked" : "" %>/>
						<span class="list-group-item-text">Yes</span>
					</label>
					<label>
						<input type="radio" name="email" value="no" <%= email1.equals("no") ? "checked" : "" %>/>
						<span class="list-group-item-text">No</span>
					</label>				
				</div>
			</div>
			
			<div class="list-group radio-list-group mb-4">
				<span class="input-group-text">Email Reception 2</span>
				<div class="list-group-item">	
					<%if(email2.equals("yes")){%>				
						<label>
							<input type="radio" name="email2" value="yes" checked />
							<span class="list-group-item-text">Yes</span>
						</label>
						<label>
							<input type="radio" name="email2" value="no" />
							<span class="list-group-item-text">No</span>
						</label>	
					<%}else{ %>
						<label>
							<input type="radio" name="email2" value="yes"/>
							<span class="list-group-item-text">Yes</span>
						</label>
						<label>
							<input type="radio" name="email2" value="no" checked />
							<span class="list-group-item-text">No</span>
						</label>	
					<%} %>			
				</div>
			</div>
			
			<div class="input-group mb-4">
				<label class="input-group-text" for="inputGroupSelect01">What You Concern</label>
				<select class="form-select" id="inputGroupSelect01" name="concern">
					<option selected value="">Choose</option>
					<option value="game" <%=concern.equals("game")?"selected":"" %>>game</option>
					<option value="movie" <%=concern.equals("movie")?"selected":"" %>>movie</option>
					<option value="etc" <%if(concern.equals("etc")){%>
						selected
						<%}%>>etc
					</option>
				</select>
			</div>

			<div class="list-group checkbox-list-group mb-4">
				<span class="input-group-text">Language Preferance</span>		
				<div class="list-group-item">
					<label>
						<input type="checkbox" name="language" value="Java" <%=data.contains("Java")?"checked":"" %> />
						<span class="list-group-item-text">Java</span> 
					</label>
					<label>
						<input type="checkbox" name="language" value="Python" <%=data.contains("Python")?"checked":"" %>/>
						<span class="list-group-item-text">Python</span> 
					</label>
					<label>
						<input type="checkbox" name="language" value="C++" <%=data.contains("C++")?"checked":"" %>/>
						<span class="list-group-item-text" >C++</span> 
					</label>
				</div>						
			</div>	
			<div class="input-group mb-4">
					<span class="input-group-text">Comment</span>
					<textarea class="form-control" name="comment"><%=comment %></textarea>
				</div>
	
				<button class="btn btn-primary mb-4" type="submit">sign-up</button>
		</form>
	</div>
</body>
</html>









