<%@page import="test.message.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//글번호를 가져와서 해당하는 글을 삭제
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=MessageDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/message/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("게시글을 삭제하였습니다.");
			location.href="${pageContext.request.contextPath}/message/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("게시글 삭제가 실패하였습니다!");
			location.href="${pageContext.request.contextPath}/message/detail.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>