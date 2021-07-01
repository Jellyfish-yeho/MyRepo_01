
<%@page import="myWebsDao.MyDao"%>
<%@page import="MyWebsDto.MyDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//1. form 전송되는 수정할 회원의 정보를 읽어온다. 
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String message=request.getParameter("message");
	//2회원의 정보를 MemberDto 객체에 담는다. 
	MyDto dto=new MyDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setMessage(message);
	//db에 수정 반영한다. 
	boolean isSuccess=MyDao.getInstance().update(dto);
	//3. 응답한다.
%>
{"isSuccess":<%=isSuccess%>}