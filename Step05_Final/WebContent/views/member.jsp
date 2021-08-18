<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member.jsp</title>
</head>
<body>
	<h1>회원 한명의 정보</h1>
	<p>번호: ${requestScope.dto.getNum() }</p>
	<p>이름: ${dto.name }</p>
	<p>주소: ${dto.addr }</p>
</body>
</html>