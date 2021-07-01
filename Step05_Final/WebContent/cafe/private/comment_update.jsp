<%@page import="test.cafe.dao.CafeCommentDao"%>
<%@page import="test.cafe.dto.CafeCommentDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//ajax 전송되는 수정할 댓글의 번호와 내용을 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	//dto에 담는다.
	CafeCommentDto dto=new CafeCommentDto();
	dto.setNum(num);
	dto.setContent(content);
	//DB에 수정 반영한다. 
	boolean isSuccess=CafeCommentDao.getInstance().update(dto);
	//JSON으로 응답한다. 
%>
{"isSuccess":<%=isSuccess%>}