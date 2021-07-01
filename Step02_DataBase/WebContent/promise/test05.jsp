<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test05.jsp</title>
</head>
<body>
	<script>
		console.log("Promise start");	
		new Promise(function(resolve, reject){ //실행하지 못했다 = reject
			let obj={num:1, name:"jellyfish"};
			//resolve 함수를 호출하면서 data를 전달할 수도 있다. 
			resolve(obj);
		
		}).then(function(a){
			console.log("then 안에 있는 함수가 호출되었습니다.")
			//a는 resolve 함수를 호출하면서 전달한 data이다. 
			console.log(a);
		}).catch(function(){
			//reject 함수를 호출하면 실행순서가 여기로 들어온다. 
			console.log("catch 안에 있는 함수가 호출되었습니다.")
		});		
		console.log("Promise 시작 후 다른 작업을 합니다.");
	</script>
</body>
</html>