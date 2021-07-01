<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test05.jsp</title>
</head>
<body>
	<input type="text" id="inputMsg" placeholder="enter text to send..." />
	<button id="sendBtn">send</button>
	<script>
		//메시지를 입력하고 전송 버튼을 눌렀을 때, 페이지 전환 없이 post 방식으로 send2.jsp 페이지에 전송하기
		document.querySelector("#sendBtn").addEventListener("click",function(){
			//입력한 문자열을 읽어온다.
			let msg=document.querySelector("#inputMsg").value;
			//특수문자를 post 방식 전송이 가능한 문자로 인코딩하기
			const encodedMsg=encodeURIComponent(msg)
			//인코딩 후 모양을 콘솔창에서 확인
			console.log("encodedMsg: "+encodedMsg);
			//인코딩된 문자열을 query string 형식으로 만들기
			const queryString="msg="+encodedMsg;
			
			fetch("send2.jsp",{
				method:"post",
				headers:{"Content-type":"application/x-www-form-urlencoded; charset=utf-8"},
				body:queryString
			})
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
		})
	</script>
</body>
</html>