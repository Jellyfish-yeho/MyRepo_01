<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test04.jsp</title>
</head>
<body>
	<script>
		console.log("Promise start");	
		new Promise(function(resolve, reject){ //실행하지 못했다 = reject

				//1. 무언가 원하는 작업을 하고
				console.log("reject는 function type이다.");
				console.log(reject);
				//2. 작업이 실패이거나 작업을 중지하고자 한다면 두번째 인자로 전달된 함수를 호출하면 된다. 
				reject();

		
		}).then(function(){
			console.log("then 안에 있는 함수가 호출되었습니다.")
		}).catch(function(){
			//reject 함수를 호출하면 실행순서가 여기로 들어온다. 
			console.log("catch 안에 있는 함수가 호출되었습니다.")
		});		
		console.log("Promise 시작 후 다른 작업을 합니다.");
	</script>
</body>
</html>