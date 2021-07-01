<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test03.jsp</title>
</head>
<body>
	<input type="text" id="inputName" placeholder="Enter your name..."/>
	<input type="text" id="inputAddr" placeholder="Enter your address..."/>
	<button id="sendBtn">send</button>
	<script>
		/*
			1. send 버튼을 누르면 입력한 이름과 주소를 읽어와서
			2. add.jsp 페이지에 ajax 전송하고
			3. add.jsp 페이지에서는 전송된 내용을 콘솔에 출력하고
			4. added! 라는 문자열을 add.jsp 페이지에서 응답하는 프로그래밍을 해 보세요. 
			
			add.jsp?name=xxx&addr=xxx
			= query string
		*/
		document.querySelector("#sendBtn").addEventListener("click",function(){
			let name = document.querySelector("#inputName").value;
			let addr = document.querySelector("#inputAddr").value;
			fetch("add.jsp?name="+name+"&addr="+addr)
			.then(function(response){
				return response.text();
			})
			
			.then(function(data){
				console.log(data);
			});
		});
	</script>
</body>
</html>