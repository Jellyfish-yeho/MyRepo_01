<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session 영역에서 로그인된 아이디를 읽어온다. 
	String id = (String)session.getAttribute("id");
	//2. 해당 id를 db에서 삭제한다.
	boolean isDelete = UsersDao.getInstance().delete(id);
	//3. 로그아웃 처리를 한다.
	session.removeAttribute("id");
	//4. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/delete.jsp</title>
</head>
<body>
	<h1>alert</h1>
	<p>
		<strong><%=id %></strong>, successfully quit from our page. 
		<a href="<%=request.getContextPath()%>/index.jsp">back to index</a>
	</p>
</body>
</html>