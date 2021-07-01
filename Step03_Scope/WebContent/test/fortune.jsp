<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		foretuneServlet이 오늘의 운세를 대신 응답해 달라고 한다. 
		그런데 오늘의 운세가 도대체 어디있어? 
		알아야 응답해줄거 아녀? - _-
		...
		request 영역에 "fortuneToday"라는 키값으로 String type을 담아 뒀구만
		갖다 써줄게
	*/
	String fortune = (String)request.getAttribute("fortuneToday");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/fortune.jsp</title>
</head>
<body>
	<p>오늘의 운세 : <strong> <%=fortune%> </strong></p>
</body>
</html>