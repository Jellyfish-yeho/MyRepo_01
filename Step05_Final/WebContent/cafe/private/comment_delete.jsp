<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="false"%>
<%
	//삭제할 댓글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//db에서 삭제한다.
	boolean isSuccess=CafeCommentDao.getInstance().delete(num);
	//json으로 응답한다.
%>
{"isSuccess":<%=isSuccess %>}
