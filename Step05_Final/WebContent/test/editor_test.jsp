<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editor_test.jsp</title>
</head>
<body>
	<h1>Editor test</h1>
	<input type="color" id="color" />
	<select id="size">
		<option>16</option>
		<option>20</option>
		<option>24</option>
	</select>
	<br />
	<textarea id="area" cols="30" rows="10"></textarea>
	<div id="result">
		
	</div>
	<script>
	let selectedColor="#000000";
	let selectedSize=16;
		document.querySelector("#color").addEventListener("change",function(){
			selectedColor=this.value;
			transform();
		});
		document.querySelector("#size").addEventListener("change",function(){
			selectedSize=this.value;
			transform();
		});
		document.querySelector("#area").addEventListener("input",function(){
			transform();
		});		
		
		function transform(){
			let str=document.querySelector("#area").value;
			let result=str.replaceAll("\n","<br/>");
			let p=
				`<p style="color:\${selectedColor};font-size:\${selectedSize}px;">\${result}</p>`;
			document.querySelector("#result").innerHTML=p;
		}
	</script>
</body>
</html>


