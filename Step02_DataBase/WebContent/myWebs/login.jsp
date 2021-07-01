<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//id, pw 파라미터 
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
//저장된 id/pw와 일치하는 지 확인 - 일치하면 유효
boolean isValid=false;
if(id.equals("haeri")&&pwd.equals("1004")){
	isValid=true;
}

//쿠키 생성하기 - isSave 값이 존재할 때
String isSave=request.getParameter("isSave");
if(isSave!=null){
	//id, pw에 대한 쿠키 생성하고 (하루) response에 추가
	Cookie idCook = new Cookie ("savedId",id);
	Cookie pwdCook = new Cookie ("savedPwd",pwd);
	idCook.setMaxAge(60*60*24);
	pwdCook.setMaxAge(60*60*24);
	response.addCookie(idCook);
	response.addCookie(pwdCook);
}else{ //isSave 값이 없으면 유지시간 0초
	Cookie idCook = new Cookie ("savedId",id);
	Cookie pwdCook = new Cookie ("savedPwd",pwd);
	idCook.setMaxAge(0);
	pwdCook.setMaxAge(0);
	response.addCookie(idCook);
	response.addCookie(pwdCook);
}

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myWebs/login.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../myWebs/navbar.jsp"></jsp:include>
	<div class="container">
		<%if(isValid){ %>
			<div class="alert alert-success">
				<strong><%=id %></strong> logged in. 
				<a class="alert-link" href="<%=request.getContextPath()%>/myWebs/01_SHINee.jsp">Main</a>
			</div>
		<%}else{ %>
			<div class="alert alert-danger">
				Failed to log in.
				<a class="alert-link" href="<%=request.getContextPath()%>/myWebs/login_form.jsp">Try Again</a>
			</div>
		<%} %>
	</div>
</body>
</html>