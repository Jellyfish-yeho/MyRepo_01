<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/uploadform.jsp</title>
</head>
<body>
	<div class="container">
		<h1>File Upload Form</h1>
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">title</label>
				<input type="text" name="title" id="title" />
			</div>
			<div>
				<label for="myFile">file</label>
				<input type="file" name="myFile" id="myFile" />
			</div>		
			<button type="submit">upload</button>
		</form>
	</div>
</body>
</html>