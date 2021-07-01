<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//쿠키 읽어오기, 저장할 문자열 설정
Cookie[] cooks=request.getCookies();
String savedId = null;
String savedPwd = null;
//쿠키배열이 null이 아니면 배열을 반복문으로 출력해서 key값을 문자열에 저장
//값이 null이면 savedId, savedPwd에 value값을 저장
if(cooks!=null){
	for(Cookie tmp:cooks){
		String key=tmp.getName();
		if(key.equals("savedId")){
			savedId=tmp.getValue();
		}else if(key.equals("savedPwd")){
			savedPwd=tmp.getValue();
		}
	}
}


%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myWebs/login_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body class="text-center">
<jsp:include page="../myWebs/navbar.jsp"></jsp:include>	
	<div class="container">
		<form action="login.jsp" method="post">
			<img src="<%=request.getContextPath()%>/myWebsImg/taemin.jpg" width="150"/>
			
			<h1 class="h3 mb-3 fw-normal">Log in</h1>
			
			<%if(savedId==null){ %>	
				<div class="form-floating">
					<input type="text" class="form-control" name="id" id="id"  />
					<label for="id">ID</label>
				</div>
				
				<div class="form-floating">
					<input type="password" class="form-control" name="pwd" id="pwd" />
					<label for="pwd">PassWord</label>
				</div>
				
				<div class="checkbox mb-3">
					<label>
						<input type="checkbox" name="isSave" value="yes" />Remember me
					</label>
				</div>				
			<%}else{ %>
				<div class="form-floating">
					<input type="text" class="form-control" name="id" id="id" value="<%=savedId %>" />
					<label for="id">ID</label>
				</div>
				
				<div class="form-floating">
					<input type="password" class="form-control" name="pwd" id="pwd" value="<%=savedPwd %>" />
					<label for="pwd">PassWord</label>
				</div>
				
				<div class="checkbox mb-3">
					<label>
						<input type="checkbox" name="isSave" value="yes" checked/>Remember me
					</label>
				</div>
			<%} %>
			
				
		</form>
		<p class="mt-5 mb-3 text-muted">&copy; 2021</p>
	</div>
</body>
</html>