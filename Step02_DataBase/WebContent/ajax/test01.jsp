<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/ajax/test01.jsp</title>
</head>
<body>
	<button id="requestBtn">요청하기</button>
	<button id="requestBtn2">요청하기2</button>
	<button id="requestBtn3">요청하기3</button>
	<button id="requestBtn4">요청하기4</button>
	<button id="requestBtn5">요청하기5</button>
	
	<div id="result">	
	</div>	
<script>
	//requestBtn
	document.querySelector("#requestBtn").addEventListener("click",function(){
		fetch("get_data.jsp")
		.then(function(response){
			//response는 응답 객체이다
			console.log(response);
			//응답 객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다. 
			return response.text();
		})
		.then(function(data){
			//data는 서버가 응답한 문자열이다. 
			console.log(data);
		});
	});
	//requestBtn2
	document.querySelector("#requestBtn2").addEventListener("click",function(){
		fetch("get_data2.jsp")
		.then(function(response){
			//response는 응답 객체이다
			console.log(response);
			//응답 객체의 text() 함수를 호출해서 리턴되는 Promise 객체를 리턴해준다. 
			return response.text();
		})
		.then(function(data){
			//data는 html 형식의 문자열이다. 
			document.querySelector("#result").innerHTML=data;
		});
	});	
	//requestBtn3
	document.querySelector("#requestBtn3").addEventListener("click",function(){
		fetch("get_data3.jsp")
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			//data는 서버가 응답한 JSON 형식의 문자열이다
			console.log(data);
			//object로 바꾸기
			let obj=JSON.parse(data);
			let p1=document.createElement("p");
			p1.innerText="번호: "+obj.num+" / 이름 :"+obj.name+" / 남잔가요? :"+obj.isMan;
			document.querySelector("#result").append(p1);
		});
	});	
	//requestBtn4
	document.querySelector("#requestBtn4").addEventListener("click",function(){
		fetch("get_data3.jsp")
		.then(function(response){
			//서버가 JSON 형식의 문자열을 응답할 때는, .json() 함수를 호출해서 리턴한다. 
			return response.json();
		})
		.then(function(data){
			//data는 object이다. 
			console.log(data);
			let p1=document.createElement("p");
			p1.innerText="번호: "+data.num+" / 이름 :"+data.name+" / 남잔가요? :"+data.isMan;
			document.querySelector("#result").append(p1);
		});
	});	
	//requestBtn5
	document.querySelector("#requestBtn5").addEventListener("click",function(){
		fetch("animals.jsp")
		.then(function(response){
			//서버가 JSON 형식의 문자열을 응답할 때는, .json() 함수를 호출해서 리턴한다. 
			return response.json();
		})
		.then(function(data){
			//data는 array이다. 
			console.log(data);
			//ul 요소를 만든다.
			let ul=document.createElement("ul");
//			let div=document.querySelector("#result");
			//반복문 돌면서 li 요소를 만들고 array에 있는 문자열을 innerText로 출력해서 ul에 추가			
			for(let i=0; i<data.length; i++){
				let tmp = document.createElement("li");
				tmp.innerText=data[i];
				ul.append(tmp);				
//				let tmp=data[i];
//				let li1=document.createElement("li");
//				li1.innerText=tmp;					
//				ul1.append(li1);
//				div.append(ul1);
			}	
			document.querySelector("#result").append(ul);
		});
	});	
</script>

</body>
</html>