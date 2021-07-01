<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1. form 전송되는 수정할 회원의 정보를 읽어온다. 
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String addr=request.getParameter("addr");
	//회원의 정보를 MemberDto객체에 담는다. 
	MemberDto dto=new MemberDto();	
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	//2. DB에 수정 반영한다.
	boolean isSuccess=MemberDao.getInstance().update(dto);	
	//3. 응답한다. 	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<%-- 클라이언트가 해석할 javascript 를 응답하고 싶으면 script 요소 안에 javascript를 작성한다. --%>
		<script>
			alert("<%=num%>번 회원의 정보를 수정했습니다.");
			//javascript 로 페이지 이동을 시킬 수 있다. 
			location.href="/Step02_DataBase/member/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패");
			location.href="list.jsp";
		</script>
	<%} %>
</body>
</html>