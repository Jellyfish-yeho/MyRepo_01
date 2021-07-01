<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//request에 "dto"라는 키값으로 담긴 MemberDto type객체 얻어오기
	MemberDto dto=(MemberDto)request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/detail.jsp</title>
</head>
<body>
	<h1>member info</h1>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Addr</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=dto.getNum() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getAddr() %></td>
			</tr>
		</tbody>
	</table>
</body>
</html>