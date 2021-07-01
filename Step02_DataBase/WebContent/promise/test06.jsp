<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test06.jsp</title>
</head>
<body>
	<script>
		console.log("Promise start");	
		new Promise(function(resolve, reject){ 
			console.log("1st stage done");
			let isGo=confirm("shall we go to next stage?");
			if(isGo){
				resolve();
			}else{
				reject();
			}		
		}).then(function(a){
			console.log("2nd stage done");
		}).catch(function(){
			console.log("work finished.");
		});		
		console.log("Promise finished, another work start");
	</script>
</body>
</html>