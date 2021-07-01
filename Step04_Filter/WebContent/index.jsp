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
		<h1>index page</h1>
		<form action="send.jsp" method="post">
			<input type="text" name="msg" placeholder="input message..."/>
			<button type="submit">send</button>
		</form>
		<%
			//session 영역에 id라는 키값으로 저장된 값이 있는지 읽어온다. 
			String id=(String)session.getAttribute("id");
		%>
		
		<%if(id==null){ %>
			<h2>login form</h2>
			<form action="users/login.jsp" method="post">
				<input type="hidden" name="url" value="<%=request.getContextPath()%>/"/>
				<input type="text" name="id" placeholder="input id..."/>
				<button type="submit">login</button>
			</form>
		<%}else{ %>
			<p>
				<strong><%=id %></strong> logged in.
				<a href="users/logout.jsp">logout</a>
			</p>
		<%} %>
		<ul>
			<li><a href="private/play.jsp">play</a></li>
			<li><a href="private/study.jsp">study</a></li>
			<li><a href="private/buy.jsp?num=1&amount=5">1번 상품 5개 구매하기</a></li>
			<li><a href="private/buy.jsp?num=2&amount=3">2번 상품 3개 구매하기</a></li>
		</ul>
	</div>
</body>
</html>



