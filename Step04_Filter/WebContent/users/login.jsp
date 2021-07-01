<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 후 가야하는 목적지 정보
	String url=request.getParameter("url");

	String id = request.getParameter("id");
	//로그인 처리
	session.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<p><strong><%=id %></strong> logged in.</p>
	<a href="<%=url%>">confirm</a>
</body>
</html>