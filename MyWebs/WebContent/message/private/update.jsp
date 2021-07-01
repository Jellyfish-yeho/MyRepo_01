<%@page import="test.message.dao.MessageDao"%>
<%@page import="test.message.dto.MessageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 값 읽어오기 : 게시글 번호, 제목, 카테고리, 내용
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String category=request.getParameter("category");
	String content=request.getParameter("content");
	//dto에 넣는다.
	MessageDto dto=new MessageDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setCategory(category);
	dto.setContent(content);
	//db에 수정 반영한다
	boolean isSuccess=MessageDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/message/private/update.jsp</title>
</head>
<body>
	<%if(isSuccess) {%>
		<script>
			alert("게시글을 수정하였습니다.");
			location.href="${pageContext.request.contextPath}/message/detail.jsp?num=<%=dto.getNum()%>";
		</script>
	<%}else{ %>
		<h2>알림</h2>
		<p>게시글 수정에 실패하였습니다.</p>
		<a href="${pageContext.request.contextPath}/message/detail.jsp?num=<%=dto.getNum()%>">다시 시도</a>
	<%} %>
</body>
</html>