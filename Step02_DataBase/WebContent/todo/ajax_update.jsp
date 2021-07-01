<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
<%
	//update 하기 
	//form 에서 가져온 내용 읽어와서 dto에 담아서 db에 반영 
	//한글 깨지지 않도록 요청 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 내용을 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	String regdate=request.getParameter("regdate");
	//TodoDto에 담아서
	TodoDto dto=new TodoDto();
	dto.setNum(num);
	dto.setContent(content);
	dto.setRegdate(regdate);
	//db에 수정 반영하기
	TodoDao dao=TodoDao.getInstance();
	boolean isSuccess=dao.update(dto);
%>
{"isSuccess":<%=isSuccess%>}