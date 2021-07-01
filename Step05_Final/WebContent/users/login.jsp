<%@page import="java.net.URLEncoder"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 후에 이동해야 하는 목적지
	String url=request.getParameter("url");
	//인코딩된 목적지 (로그인 실패 시 필요)
	String encodedUrl=URLEncoder.encode(url);	
	
	//1. 폼 전송되는 아이디와 비밀번호를 읽어온다. 
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	//2. DB에 실제 존재하는 정보인지 확인한다. 
	boolean isValid=UsersDao.getInstance().isValid(dto);
	//3. 유효한 정보이면 로그인 처리를 하고 응답, 그렇지 않으면 아이디 혹은 비밀번호가 틀렸다고 응답
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<h1>Alert</h1>
		<%if(isValid){ 
			//로그인 했다는 의미에서 session 영역에 "id"라는 key값으로 로그인된 아이디를 담는다. 
			session.setAttribute("id", id);
			//아무런 동작(=요청)을 하지 않았을 때, 초 단위로 세션 유지시간을 설정할 수 있다. 
			session.setMaxInactiveInterval(60*60);%>
			<p>
				<strong><%=id %></strong>, you are successfully logged in.
				<a href="<%=url%>">back to previous page</a>
			</p>
		<%}else{ %>
			<p>
				id or password is incorrect.
				<a href="loginform.jsp?url=<%=encodedUrl%>">try again</a>
			</p>
		<%} %>
		</div>
</body>
</html>