<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_vue/hello.jsp</title>
</head>
<body>
	<div id="one">
		<input type="text" id="inputMsg" placeholder="input msg..." />
		<p id="result"></p>
	</div>
	
	<div id="two">
		<input v-model="msg" type="text" placeholder="input msg..." />
		<p>{{msg}}</p>
		<h1>Shining SHINee</h1>
		<ul>
			<li v-for="tmp in friends">
				{{tmp}}
			</li>
		</ul>
	</div>
	
	<!-- vue js 외부 javascript 로딩하기-->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	
	<script>
		document.querySelector("#inputMsg").addEventListener("input",function(){
			const msg=this.value;
			document.querySelector("#result").innerText=msg;
		});
		
		let app=new Vue({
			el:"#two",
			data:{
				msg:"",
				friends:["온유","민호","키","태민"]
			}
		});
		
		
	</script>
</body>
</html>





