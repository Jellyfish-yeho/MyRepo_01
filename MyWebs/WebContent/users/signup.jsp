<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼에서 전송되는 id, pwd 파라미터 값을 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//dto에 회원 정보를 담고 
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//dao를 이용하여 저장한다.
	boolean isSuccess=UsersDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p><%=id %> 님, 빵!! 부대 가입을 축하드립니다!</p>	
			<a href="${pageContext.request.contextPath}/index.jsp">메인으로</a>
		<%}else{ %>
			<p>가입 실패하였습니다. </p>
			<a href="${pageContext.request.contextPath}/users/signup_form.jsp">다시 시도</a>
		<%} %>
	</div>
</body>
</html>