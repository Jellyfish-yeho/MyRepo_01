<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/sale.jsp</title>
</head>
<body>
	<h1>★Summer Sale★</h1>
	<p>
		<img src="myWebsImg/atlantis02.jpg" width=200px />
		<br />
		<a href="https://smtownandstore.com/product/event/SHINee_13th_ANNIVERSARY.html">
			샤이니 굿즈 구매하러 가기
		</a>
	</p>
	<form action="nopopup.jsp" method="post">
		<label>
		<input type="checkbox" name="isPopup" value="no"/>
		1분동안 팝업 띄우지 않기
		</label>
		<button type="submit">닫기</button>
	</form>
	
</body>
</html>