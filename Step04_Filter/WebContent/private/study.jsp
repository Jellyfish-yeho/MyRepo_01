<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/private/study.jsp</title>
</head>
<body>
	<%
		//만일 로그인 하지 않았다면
		String id=(String)session.getAttribute("id");

	%>
	<h1>Place for people who logged in.</h1>
	<p>
		<strong><%=id %></strong>, let's study... 
	</p>
</body>
</html>