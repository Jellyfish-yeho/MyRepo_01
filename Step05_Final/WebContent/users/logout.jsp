<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃은  session영역에 저장된 id값을 삭제하면 된다. 
	session.removeAttribute("id");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/logout.jsp</title>
</head>
<body>
	<script>
		alert("successfully logged out.");
		//javascript를 활용해서 index.jsp페이지로 redirect 시키기
		location.href="<%=request.getContextPath()%>/index.jsp";
		//location.replace("<%=request.getContextPath()%>/index.jsp"); 이것도 가능한데 history가 쌓이지 않음.
	</script>
</body>
</html>