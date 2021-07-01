<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("id");
	String cpath=request.getContextPath();
	response.sendRedirect(cpath+"/index.jsp");
%>
