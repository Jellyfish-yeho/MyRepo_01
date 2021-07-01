<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test04.jsp</title>
</head>
<body>
	<h1>폼 테스트</h1>
	<p>폼에 submit 이벤트가 일어났을 때 폼 전송을 막고 폼에 입력한 문자열을 읽어와서 ajax 전송해보기</p>
	<form action="add.jsp" method="get" id="myForm">
		<input type="text" name="name" placeholder="enter name.."/>
		<input type="text" name="addr" placeholder="enter address..." />
		<button type="submit">send</button>
	</form>
	<script>
		document.querySelector("#myForm").addEventListener("submit",function(e){
			//기본 동작을 막는다 => 폼이 제출되지 않게 막는다. 
			e.preventDefault();
			//this 는 "submit"이벤트가 일어난 바로 그 문서 객체이므로 form 이다. 
			console.log(this);
			//폼에 입력한 내용을 query string 형식으로 얻어내기
			const formData=new FormData(this);
			const params=new URLSearchParams(formData);
			console.log(params);
			const queryString=params.toString();			
			//const queryString=new URLSearchParams(new FormData(this)).toString(); <= 한줄로 쓰기			
			console.log(queryString);
			//얻어낸 query string을 fetch()함수에서 사용하기
			fetch("add.jsp?"+queryString)
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