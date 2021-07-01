<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 에 id 라는 키값으로 저장된 값을 가지고 와서 삭제한 후 리다이렉트 응답을 한다
	session.removeAttribute("id");
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/index.jsp");
%>
