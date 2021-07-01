<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//아이디 불러오기
	String id=(String)session.getAttribute("id");
	//가입 정보를 읽어온다. 
	UsersDto dto=UsersDao.getInstance().getData(id);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/info.jsp</title>
</head>
<body>
	
</body>
</html>