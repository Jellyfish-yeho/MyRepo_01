<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>	
	<div class="container mt-3 mb-5">	
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">Index</a></li>
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/member/list.jsp">Member List</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Insert Form</li>
		  </ol>
		</nav>
		<div class="row">
			<div class="col-sm-6 offset-sm-3">
				<form action="insert.jsp" method="post">
					<div class="mb-3">
						<label class="form-label" for="name">이름</label>
						<input class="form-control" type="text" name="name" id="name"/>
					</div>
					<div class="mb-3">
						<label class="form-label" for="addr">주소</label>
						<input class="form-control"type="text" name="addr" id="addr"/>
					</div>
					<button class="btn btn-primary" type="submit">Add</button>
				</form>			
			</div>
		</div>
	</div>
</body>
</html>