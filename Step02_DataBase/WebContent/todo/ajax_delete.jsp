<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	boolean isSuccess=TodoDao.getInstance().delete(num);
%>
{"isSuccess":<%=isSuccess%>}