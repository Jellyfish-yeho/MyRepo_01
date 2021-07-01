<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/bootstrap/modal.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
	<div class="container mt-3">
		<h1>modal test</h1>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#msgModal">
		  Launch demo modal
		</button>		
		<!-- Modal -->
		<div class="modal fade" id="msgModal" tabindex="-1" >
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">title</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" ></button>
					</div>
					<div class="modal-body">
						content
						<input id="inputMsg" type="text" class="form-control" placeholder="input your msg here..."/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button id="saveBtn" type="button" class="btn btn-primary">Save changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%
	String myName="JellyFish";
	int myNum=999;
	boolean isRun=true;
%>
<script>
	let myName="<%=myName%>";
	let myNum=<%=myNum%>;
	let isRun=<%=isRun%>;
	//저장 버튼을 눌렀을 때 실행할 함수 등록
	document.querySelector("#saveBtn").addEventListener("click",function(){
		let msg=document.querySelector("#inputMsg").value;
		console.log(msg+" is saved.");
		//띄운 modal의 참조값을 얻어와서
		let m=bootstrap.Modal.getInstance(document.querySelector("#msgModal"));
		//숨기기
		m.hide();
	});
</script>
</body>
</html>





