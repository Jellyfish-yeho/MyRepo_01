<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//thisPage 라는 파라미터명으로 전달되는 문자열을 얻어온다. 
    	//null or "member" or "todo" 
    	String thisPage=request.getParameter("thisPage");
    	//thisPage가 null이면 index.jsp에 포함된 것이다. 
    	//System.out.println(thisPage);
    	//만일 null이면
    	if(thisPage==null){
    		//빈 문자열을 대입한다. NullPointerException 방지 용도
    		thisPage="";
    	}
    	
    %>
	<nav class="navbar navbar-light navbar-expand-sm bg-light">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/">
				<img src="<%=request.getContextPath()%>/BerryBerry.png" alt="" width="30" height="24">
				Hello, world!
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("member") ? "active" : "" %>" href="<%=request.getContextPath() %>/member/list.jsp">Member</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("member2") ? "active" : "" %>" href="<%=request.getContextPath() %>/member/list2.jsp">Member2</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("todo") ? "active" : "" %>" href="<%=request.getContextPath() %>/todo/list.jsp">Todo</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("todo2") ? "active" : "" %>" href="<%=request.getContextPath() %>/todo/list2.jsp">Todo2</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=thisPage.equals("ajax") ? "active" : "" %>" href="<%=request.getContextPath() %>/ajax/test01.jsp">ajax</a>
				</li>
			</ul>
				<div class="w-100 clearfix">
					<a class="btn btn-danger btn-sm float-end ms-2" href="<%=request.getContextPath()%>/users/signup_form.jsp">sign-up</a>
					<a class="btn btn-success btn-sm float-end" href="<%=request.getContextPath()%>/users/login_form.jsp">log-in</a>
				</div>
			</div>
      </div>
   </nav>
