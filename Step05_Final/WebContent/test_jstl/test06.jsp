<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//sample data
	request.setAttribute("hobby", "game/programming/piano");
	request.setAttribute("friends", "온유,민호,키,태민");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test06.jsp</title>
</head>
<body>
	<h1>forTokens 활용</h1>
	<h2>취미 목록</h2>
	<ul>
		<c:forTokens var="tmp" items="${hobby}" delims="/">
			<li>${tmp}</li>
		</c:forTokens>
	</ul>
	
	<hr />
	<h2>친구 목록</h2>
	<ul>
		<c:forTokens var="tmp" items="${friends}" delims=",">
			<li>${tmp}</li>
		</c:forTokens>
	</ul>
</body>
</html>