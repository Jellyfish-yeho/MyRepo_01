<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/drag_test.jsp</title>
<style>
	.drag-area{
		width: 500px;
		height: 300px;
		border: 2px dashed gray;
		border-radius: 20px;
	}
</style>
</head>
<body>
<h1>drag test</h1>
<div class="drag-area"></div>
<input type="file" id="myFile"/>
<script>
	//dragenter 이벤트가 일어났을 때 실행할 함수 등록
	document.querySelector(".drag-area").addEventListener("dragenter",function(e){
		console.log("dragenter!");
		//drop 이벤트까지 진행될 수 있도록 기본 동작을 막는다.
		e.preventDefault();
	});
	//dragover 이벤트가 일어났을 때 실행할 함수 등록
	document.querySelector(".drag-area").addEventListener("dragover",function(e){
		console.log("dragover!");
		//drop 이벤트까지 진행될 수 있도록 기본 동작을 막는다.
		e.preventDefault();
	});
	//drop 이벤트가 일어났을 때 실행할 함수 등록
	document.querySelector(".drag-area").addEventListener("drop",function(e){
		console.log("drop!");
		//drop 이벤트까지 진행될 수 있도록 기본 동작을 막는다.
		e.preventDefault();
		//drop된 파일의 여러가지 정보를 담고 있는 object
		const data = e.dataTransfer;
		//drop된 파일 객체를 저장하고 있는 배열
		const files = data.files;
		console.log(files);
		//input 요소에 drop된 파일 정보를 넣어준다. 
		document.querySelector("#myFile").files = files;
	});
	
</script>
</body>
</html>


