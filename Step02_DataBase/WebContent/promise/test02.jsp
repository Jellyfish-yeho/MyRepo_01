<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test02.jsp</title>
</head>
<body>
	<script>
		new Promise(function(a){ //new 하자마자 실행순서는 Promise 안으로 옴. 
			//1. 무언가 원하는 작업을 하고
			console.log("a는 function type이다.");
			console.log(a);
			//2. 함수의 첫번째 인자로 전달된 함수로 호출을 해주면
			a();
		}).then(function(){
			//3. then 안에 있는 함수가 호출된다. 
			console.log("then 안에 있는 함수가 호출되었습니다.")
		});
		
	</script>
</body>
</html>