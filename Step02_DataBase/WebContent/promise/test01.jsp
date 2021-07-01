<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test01.jsp</title>
</head>
<body>
	<script>
		//주어진 작업을 수행하는 함수
		//첫번째 인자로는 작업의 내용이 전달되고, 
		//두번째 인자로는 작업이 끝나면 호출할 함수를 전달한다. 
		function work(job, callback){
			//작업을 끝마치는데 5초가 걸린다고 가정
			setTimeout(function(){
				console.log(job+" 수행 완료!");
				//작업이 끝났으니 callback 함수를 호출해 준다. 
				callback();
			},2000);
		}
		/*
		work("달리기",function(){
			work("물마시기",function(){
				work("쉬기",function(){
					work("밥먹기",function(){
						
					});
				});
			});
		});
		*/
		//1. Promise 객체를 생성하면서 함수를 전달한다. 
		new Promise(function(resolve){
			//2. 작업을 마쳤다면 resolve 함수를 호출한다. 
			work("run",resolve);
		}).then(function(a){
			
			return new Promise(function(resolve){
				work("water",resolve);				
			});
		}).then(function(){
			
			return new Promise(function(resolve){
				work("rest",resolve);
			});
		}).then(function(){
			
			return new Promise(function(resolve){
				work("eat",resolve);
			});
		}).then(function(){
			console.log("all completed.");
		});
	
		//인자로 전달한 작업을 수행할 Promise 객체를 생성해서 리턴해주는 함수
		function doSomething(job){
			let p=new Promise(function(resolve){
				work(job,resolve);
			});
			return p;
		}
		
		doSomething("run")
		.then(function(){
			return doSomething("water");
		})
		.then(function(){
			return doSomething("rest");
		})
		.then(function(){
			return doSomething("eat");
		})
		.then(function(){
			console.log("all completed.");
		})
		
	</script>
</body>
</html>