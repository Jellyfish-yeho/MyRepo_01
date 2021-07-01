
<%@page import="myWebsDao.MyDao"%>
<%@page import="MyWebsDto.MyDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//post 방식 전송했을 때 한글 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	//파라미터 추출
	String name=request.getParameter("name");
	String message=request.getParameter("message");
	//MemberDto에 담고
	MyDto dto=new MyDto();
	dto.setName(name);
	dto.setMessage(message);
	//MemberDao 객체를 이용해서 DB에 저장
	boolean isSuccess=MyDao.getInstance().insert(dto);
%>
{"isSuccess":<%=isSuccess%>}