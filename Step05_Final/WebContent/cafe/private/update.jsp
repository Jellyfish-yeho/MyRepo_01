<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	/*
	<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	위의 2줄은 아래의 코드를 대체할 수 있다. 
	
	//1. 폼 전송되는 수정할 글의 번호, 제목, 내용을 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. CafeDto 객체를 생성해서 담는다.
	CafeDto dto= new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	*/
	
	//3. DB에 수정 반영하고
	boolean isSuccess=CafeDao.getInstance().update(dto);
	//4. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("your post is successfully modified.");
			location.href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=dto.getNum()%>";
		</script>
	<%}else{ %>
		<h1>alert</h1>
		<p>
			failed to modify your post.
			<a href="updateform.jsp?num=<%=dto.getNum()%>">try again</a>
		</p>
	<%} %>
</body>
</html>