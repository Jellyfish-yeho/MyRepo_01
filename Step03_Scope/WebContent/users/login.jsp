<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    //id로 전송된 파라미터 값을 가져와서 session 에 저장하고 응답해 준다. 
	String id=request.getParameter("id");
	session.setAttribute("id", id);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/login.jsp</title>
</head>
<body>
	<%=id %>is logged in.
	<a href="../index.jsp">back to index</a>
</body>
</html>