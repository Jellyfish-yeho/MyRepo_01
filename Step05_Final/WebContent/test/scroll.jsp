<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/scroll.jsp</title>
<style>
	.spacer{
		height: 500px;
		background-color: #999;
		border: 1px solid red;
	}
</style>
</head>
<body>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<div class="spacer"></div>
	<script>
	/*
		window.scrollY => 위쪽으로 스크롤된 길이
		window.innerHeight => 웹브라우저의 창의 높이
		document.body.offsetHeight => body의 높이 (문서객체가 차지하는 높이)
	*/
		window.addEventListener("scroll",function(){
			console.log("scroll!");
			//바닥까지 스크롤 했는지 여부
			const isBottom=
				window.innerHeight + window.scrollY >= document.body.offsetHeight;
			if(isBottom){
				console.log("you're at the bottom of the document.");
			}
		
		});
		

	</script>
</body>
</html>