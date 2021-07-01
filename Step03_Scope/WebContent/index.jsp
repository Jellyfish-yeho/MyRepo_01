<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="fortune">오늘의 운세 보기</a></li>
			<li><a href="friends">친구 목록</a></li>
			<li><a href="member/detail">친구 한명의 정보 보기</a></li>
			<li><a href="test/check.jsp">출석체크 하러 가기</a></li>
		</ul> 
		<%
			//session영역에 "id"라는 키값으로 저장된 String type이 있는지 읽어와 본다. = HttpSession
			String id=(String)session.getAttribute("id");
		%>
		
		<%if(id==null){ %>
			<form action="users/login" method="post">
				<input type="text" name="id" placeholoder="input your id"/>
				<button type="submit">login</button>
			</form>
			<br />
			<form action="users/login.jsp" method="post">
				<input type="text" name="id" placeholoder="input your id"/>
				<button type="submit">login2</button>
			</form>
		<%}else{ %>
			<p>
				<strong><%=id %></strong> is logged in.
				<a href="users/logout">logout</a>
			</p>
			<p>
				<strong><%=id %></strong> is logged in.
				<a href="users/logout.jsp">logout</a>
			</p>
		<%} %>

	</div>
</body>
</html>