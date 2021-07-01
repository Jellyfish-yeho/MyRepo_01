<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//post 방식 => 한글 인코딩
request.setCharacterEncoding("utf-8");
//id, email, how, members, comment param 
String id=request.getParameter("id");
String email=request.getParameter("email");
String how=request.getParameter("how");
String[] members=request.getParameterValues("members");
String memberStr="";
if(members!=null){
	for(String tmp:members){
		memberStr = memberStr + tmp + "/";
	}
}

String comment=request.getParameter("comment");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/myWebs/signup.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../myWebs/navbar.jsp"></jsp:include>
	<div class="container">
		<!--  signup form  -->
		<form action="signup.jsp" method="post">
			<!-- id input : text -->
			<fieldset>
					<div class="form-group">
						<label for="id" class="form-label">ID</label>
						<input type="text" class="form-control" name="id" id="id" value="<%=id %>" disabled/>
					</div>				
			</fieldset>
			<!-- email reception yes/no : radio -->
			<fieldset>
				<legend>Email Reception</legend>
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="email" id="email1" value="yes" <%= email.equals("yes")?"checked":"" %> disabled/>
						<label for="email1" class="form-check-label">Yes</label>						
					</div>
					<div class="form-check form-check-inline">
						<input type="radio" class="form-check-input" name="email" id="email2" value="no"  <%= email.equals("no")?"checked":"" %> disabled />
						<label for="email2" class="form-check-label">No</label>						
					</div>				
			</fieldset>
			<!-- SHinee를 알게 된 계기 : select -->
			<div class="form-group">
				<label class="form-label" for="how">How did you know SHINee?</label>
				<select class="form-select" name="how" id="how" disabled>
					<option value="">Choose</option>
					<option value="friend"  <%= how.equals("friend")?"selected":"" %>>Friend</option>
					<option value="media" <%= how.equals("media")?"selected":"" %>>Media</option>
					<option value="etc" <%= how.equals("etc")?"selected":"" %>>Etc</option>
				</select>				
			</div>
			<!-- 좋아하는 멤버  : checkbox -->
			<fieldset>
				<legend>Member You Like</legend>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem1" value="onew" <%=memberStr.contains("onew")?"checked":"" %> disabled/>
					<label class="form-check-label" for="mem1">Onew</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem2" value="jonghyun" <%=memberStr.contains("jonghyun")?"checked":"" %> disabled/>
					<label class="form-check-label" for="mem2">Jonghyun</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem3" value="minho" <%=memberStr.contains("minho")?"checked":"" %> disabled/>
					<label class="form-check-label" for="mem3">Minho</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem4" value="key" <%=memberStr.contains("key")?"checked":"" %> disabled/>
					<label class="form-check-label" for="mem4">Key</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="checkbox" class="form-check-input" name="members" id="mem5" value="taemin" <%=memberStr.contains("taemin")?"checked":"" %> disabled/>
					<label class="form-check-label" for="mem5">Taemin</label>
				</div>
			</fieldset>
			<!-- 코멘트 : textarea -->
			<div class="form-group">
				<label class="form-label" for="comment">Comment</label>
				<textarea class="form-control" name="comment" id="comment" cols="30" rows="10" disabled><%=comment %></textarea>
			</div>
		</form>
	</div>
</body>
</html>
