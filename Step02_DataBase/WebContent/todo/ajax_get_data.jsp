<%@page import="org.json.JSONObject"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
	//폼 전송되는 내용을 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	TodoDto result=TodoDao.getInstance().getData(num);
	//json 객체 생성하여 tostring
	JSONObject obj=new JSONObject(result);
	String json=obj.toString();
%>
<%=json%>