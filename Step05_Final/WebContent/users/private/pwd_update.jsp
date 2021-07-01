<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session 영역에서 로그인된 아이디 얻어내기
	String id=(String)session.getAttribute("id");
	//폼 전송되는 구 비밀번호, 새 비밀번호 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//구 비밀번호가 유효한 정보인지 알아내기
	UsersDto dto=UsersDao.getInstance().getData(id);
	boolean isValid = pwd.equals(dto.getPwd());
	//구 비밀번호가 맞다면 비밀번호 수정
	if(isValid){
		//dto에 새 비밀번호를 담아서
		dto.setPwd(newPwd);
		//dao에 넘겨주고 수정 반영한다. 
		UsersDao.getInstance().updatePwd(dto);
		//비밀번호를 수정했으면 로그아웃처리를  하고 새로 로그인 하도록 한다. 
		session.removeAttribute("id");
	}
	//응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/private/pwd_update.jsp</title>
</head>
<body>
	<div class="container">
		<%if(isValid){ %>
			<p>
				<strong><%=id %></strong>, your password is modified. Please log in again.
				<a href="<%=request.getContextPath()%>/users/loginform.jsp">log in</a>
			</p>
		<%}else{ %>
			<p>
				Previous password is not valid.
				<a href="pwd_updateform.jsp">try agian</a>
			</p>
		<%} %>
	</div>
</body>
</html>