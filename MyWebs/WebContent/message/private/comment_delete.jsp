<%@page import="test.message.dao.MessageCommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//전달되는 num값을 읽어와서 db에서 삭제 후 json으로 응답
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=MessageCommentDao.getInstance().delete(num);
	
%>
{"isSuccess":<%=isSuccess %>}