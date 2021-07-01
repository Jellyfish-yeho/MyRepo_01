<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//thisPage 라는 파라미터명으로 전달되는 문자열을 얻어온다. 
	//null or "file" or "cafe" 
	String thisPage=request.getParameter("thisPage");
	//thisPage가 null이면 index.jsp에 포함된 것이다. 
	//System.out.println(thisPage);
	//만일 null이면
	if(thisPage==null){
		//빈 문자열을 대입한다. NullPointerException 방지 용도
		thisPage="";
	}
    //로그인 된 아이디 읽어오기 
    String id=(String)session.getAttribute("id");	
	//2. UsersDao 객체를 이용해서 가입된 정보를 얻어온다.
	UsersDto dto=new UsersDto();
	if(id!=null){
		dto=UsersDao.getInstance().getData(id);
	}
%>
	<nav class="navbar navbar-light navbar-expand-sm" style="background-color: #79E5CB;">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/">
				<img src="<%=request.getContextPath()%>/BerryBerry.png" alt="" width="45" height="40">
				Hello, world!
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto">
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("cafe") ? "active" : "" %>" href="<%=request.getContextPath() %>/cafe/list.jsp">Post</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("file") ? "active" : "" %>" href="<%=request.getContextPath() %>/file/list.jsp">Library</a>
				</li>
			</ul>
			<%if(id==null){ %>
				<a class="btn btn-info btn-sm me-2" href="<%=request.getContextPath()%>/users/signup_form.jsp">sign-up</a>
				<a class="btn btn-success btn-sm me-2" href="<%=request.getContextPath()%>/users/loginform.jsp">log-in</a>
			<%}else{ %>
				<%if(dto.getProfile()==null) {%>
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
						<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				<%}else{ %>
					<img class="me-2" id="profileImage" src="<%=request.getContextPath() %><%=dto.getProfile() %>" width="50" height="50" />
				<%} %>
				<span class="navbar-text me-2">
					<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a> is logged in.
				</span>
				<a class="btn btn-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">Log-out</a>
			<%} %>
			</div>
      </div>
   </nav>
