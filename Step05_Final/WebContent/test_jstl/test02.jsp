<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//테스트를 위해 sample 데이터를 request scope에 담는다.
	List<String> names=new ArrayList<>();
	names.add("온유");
	names.add("민호");
	names.add("키");
	names.add("태민");
	names.add("종현");
	
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/test02.jsp</title>
</head>
<body>
	<%
		List<String> list=(List<String>)request.getAttribute("list");
	%>
	<h1>친구 목록</h1>
	<ul>
		<%for(String tmp:list){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	
	<hr />
	
	<h1>친구 목록</h1>
	<ul>
		<c:forEach var="tmp" items="${requestScope.list}">
			<li>${tmp}</li>
		</c:forEach>
	</ul>
	
	<hr />
	
	<h1>친구 목록입니다. 인덱스 표시</h1>
	<ul>
		<c:forEach var="tmp" items="${list}" varStatus="status">
			<li>${tmp} <strong>${status.index}</strong></li>
		</c:forEach>
	</ul>
	
	<hr />
	
	<h1>친구 목록입니다. 순서 표시</h1>
	<ul>
		<c:forEach var="tmp" items="${list}" varStatus="status">
			<li>${tmp} <strong>${status.count}</strong></li>
		</c:forEach>
	</ul>
	
	<hr />
	
	<h1>친구 목록입니다. 첫번째인지 여부</h1>
	<ul>
		<c:forEach var="tmp" items="${list}" varStatus="status">
			<li>${tmp} <strong>${status.first}</strong></li>
		</c:forEach>
	</ul>
	
	<hr />
	
	<h1>친구 목록입니다. 마지막인지 여부</h1>
	<ul>
		<c:forEach var="tmp" items="${list}" varStatus="status">
			<li>${tmp} <strong>${status.last}</strong></li>
		</c:forEach>
	</ul>
</body>
</html>


