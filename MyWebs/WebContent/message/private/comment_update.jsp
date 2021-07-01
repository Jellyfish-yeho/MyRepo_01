<%@page import="test.message.dao.MessageCommentDao"%>
<%@page import="test.message.dto.MessageCommentDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//파라미터 값 읽어오기 : 댓글 번호, 내용
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	//dto에 담아서 db에 반영하고 json으로 응답하기
	MessageCommentDto dto=new MessageCommentDto();
	dto.setNum(num);
	dto.setContent(content);
	boolean isSuccess=MessageCommentDao.getInstance().update(dto);
	
%>
{"isSuccess":<%=isSuccess %>}