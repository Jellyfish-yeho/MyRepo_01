<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/jquery_test.jsp</title>
</head>
<body>
<h1>jquery test</h1>
<div>div1</div>
<div>div2</div>
<div id="one">div3</div>
<div id="two">div4</div>
<div id="three">div5</div>

<!-- jquery javascript 로딩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	/*
		id가 one인 요소의 
		1. innerText를 "김구라"
		2. 글자의 색을 "red"
		3. class 속성의 값을 "my-class"
		로 변경
	*/
	
	const one=document.querySelector("#one");
	one.innerText="kimgura";
	one.style.color="red";
	one.setAttribute("class","my-class");
	
	$("#two").text("kimgura");
	$("#two").css("color","red");
	$("#two").attr("class","my-class");
	
	$("#three")
	.text("kimgura")
	.css("color","red")
	.attr("class","my-class");

</script>
</body>
</html>


