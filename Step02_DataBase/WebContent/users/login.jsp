<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. 폼 전송되는 아이디와 비밀번호를 읽어온다. 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//2. DB에 저장된 ID, PW와 일치하는지 확인해서
	boolean isValid = false;
	if(id.equals("haeri")&&pwd.equals("1004")){ //가상으로 비밀번호를 확인한다
		//id와 pwd가 모두 일치하면 유효한 정보라고 가정한다. 
		isValid=true;
	}
	//3. 일치하면 로그인 처리 후 응답, 틀리면 ID 혹은 PW가 틀려요 라고 응답
	
	//isSave라는 파라미터명으로 넘어오는 값이 있는지 확인해서 
	String isSave=request.getParameter("isSave");
	if(isSave != null){ //만일 넘어오는 값이 있다면 = isSave가 checked 되어 있다면
		//쿠키에 id와 pw를 특정 키값으로 담아서 쿠키도 응답되도록 한다. 
		Cookie idCook = new Cookie("savedId", id);
		idCook.setMaxAge(60*60*24); //쿠키 유지시간 (초 단위) => 유지시간 하루=60*60*24 / 한달=60*60*24*30
		response.addCookie(idCook);

		Cookie pwdCook = new Cookie("savedPwd", pwd);
		pwdCook.setMaxAge(60*60*24);
		response.addCookie(pwdCook);
	}else{ //isSave 가 checked 되지 않았다면
		Cookie idCook = new Cookie("savedId", id);
		idCook.setMaxAge(0); //쿠키 유지시간을 0으로 설정해서 쿠키가 삭제되도록 한다. 
		response.addCookie(idCook);

		Cookie pwdCook = new Cookie("savedPwd", pwd);
		pwdCook.setMaxAge(0);
		response.addCookie(pwdCook);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container pt-5">
		<%if(isValid){ %>
			<div class="alert alert-success">
				<strong><%=id %></strong> : successfully logged in.
				<a href="<%=request.getContextPath()%>/" class="alert-link">Confirm</a>
			</div>
		<%}else{ %>
			<div class="alert alert-danger">
				ID or PW is wrong. 
				<a href="<%=request.getContextPath()%>/users/login_form.jsp" class="alert-link">Try Again</a>
			</div>
		<%} %>
	</div>
</body>
</html>


