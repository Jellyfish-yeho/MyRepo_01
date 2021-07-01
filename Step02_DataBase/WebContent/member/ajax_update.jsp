<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//1. form 전송되는 수정할 회원의 정보를 읽어온다. 
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//2회원의 정보를 MemberDto 객체에 담는다. 
	MemberDto dto=new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	//db에 수정 반영한다. 
	boolean isSuccess=MemberDao.getInstance().update(dto);
	//3. 응답한다.
%>
{"isSuccess":<%=isSuccess%>}