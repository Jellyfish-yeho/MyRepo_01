<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼에서 전송된 id, pwd를 읽어온다. 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	//dto에 저장한다.
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//dao의 메소드를 사용하여 dto 값이 db에 있는 값과 일치하는지 비교한다. 
	boolean isValid=UsersDao.getInstance().isValid(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isValid){ 
			session.setAttribute("id", id);%>
			<p><%=id %> 님, 로그인 되었습니다. </p>
			<a href="${pageContext.request.contextPath}/index.jsp">메인으로</a> 
		<%}else{ %>
			<p>로그인에 실패했습니다. </p>
			<a href="${pageContext.request.contextPath}/users/login_form.jsp">다시 시도</a>
		<%} %>
	</div>
</body>
</html>