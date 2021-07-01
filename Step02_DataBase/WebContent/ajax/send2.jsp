<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//post 방식 전송된 파라미터가 한글 깨지지 않도록
	request.setCharacterEncoding("utf-8");
	String msg=request.getParameter("msg");
	System.out.println(msg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/send2.jsp</title>
</head>
<body>
	<p>client, your message is well received.</p>
</body>
</html>