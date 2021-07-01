<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
//한글 인코딩
request.setCharacterEncoding("utf-8");
//폼에서 전달된 할일을 읽어와서 dto에 담는다. 
String content=request.getParameter("content");
TodoDto dto=new TodoDto();
dto.setContent(content);
//db에 저장하고 insert가 제대로 작동했는지 확인
boolean isSuccess=TodoDao.getInstance().insert(dto);
%>
{"isSuccess":<%=isSuccess%>}