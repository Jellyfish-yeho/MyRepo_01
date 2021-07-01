<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list2.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<script id="one" type="text/template">
	<tr>
		<td>\${tmp.num}</td>
		<td>\${tmp.content}</td>
		<td>\${tmp.regdate}</td>
		<td>
			<a href="javascript:updateMember(\${tmp.num})">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
			</a>
		</td>
		<td>
			<a href="javascript:deleteConfirm(\${tmp.num})">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
					<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
				</svg>
			</a>
		</td>
	</tr>
</script>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="todo2" name="thisPage"/>
	</jsp:include>
	<div class="container mt-4">
		<h1 class="p-3 mb-2 bg-primary text-white">To-do list</h1>
		<a href="javascript: " data-bs-toggle="modal" data-bs-target="#insertModal">
			<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
			  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
		</a>
		<br />
		<table class="table table-sm table-striped">
			<thead class="table-dark">
				<tr>
					<th>No</th>
					<th>Content</th>
					<th>Date</th>
					<th>Modify</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
		<div class="page-ui clearfix">
			<ul class="pagination">
				
			</ul>			
		</div>	
<%-- Modal 1 : 추가 --%>		
	<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="insertModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
                 <h5 class="modal-title" id="insertModalLabel">Insert Form</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
              <div class="modal-body">
                 <form action="ajax_insert.jsp" method="post" id="insertForm">
                    <input type="hidden" name="num" />
                    <div class="form-group">
                       <label class="form-label" for="num">Num</label>
                       <input class="form-control" type="text" id="num" disabled/>
                    </div>
                    <div class="form-group">
                       <label class="form-label" for="content">Content</label>
                       <input class="form-control" type="text" name="content" id="content"/>
                    </div>
                    <div class="form-group">
                    	<input type="hidden" name="regdate" />
                       <label class="form-label" for="regdate">Regdate</label>
                       <input class="form-control" type="text" name="regdate" id="regdate" disabled/>
                    </div>                 
                 </form>
              </div>
              <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 <button id="insertSaveBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Save</button>
             </div>
           </div>
        </div>	
        </div>
    <%-- Modal 2 : 수정 --%>		
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
                 <h5 class="modal-title" id="updateModalLabel">Update Form</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             </div>
              <div class="modal-body">
                 <form action="ajax_update.jsp" method="post" id="updateForm">
                    <input type="hidden" name="num" />
                    <div class="form-group">
                       <label class="form-label" for="num">Num</label>
                       <input class="form-control" type="text" id="num" disabled/>
                    </div>
                    <div class="form-group">
                       <label class="form-label" for="content">Content</label>
                       <input class="form-control" type="text" name="content" id="content"/>
                    </div>
                    <div class="form-group">
                    	<input type="hidden" name="regdate" />
                       <label class="form-label" for="regdate">Regdate</label>
                       <input class="form-control" type="text" name="regdate" id="regdate" disabled/>
                    </div>
                 
                 </form>
              </div>
              <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 <button id="updateSaveBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal">Save</button>
             </div>
           </div>
        </div>		    	
	</div> <!-- container end -->
	<script src="../js/gura_util.js"></script>
	<script>
	//시작 페이지 = 1
	let currentPage=1;
	pageUpdate(currentPage);
	history.replaceState(currentPage,"","?pageNum="+currentPage);
	//list update 
	function pageUpdate(pageNum){
		currentPage=pageNum;
		ajaxPromise("ajax_list.jsp","get","pageNum="+pageNum)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			//data는 배열
			let trs="";
			for(let i=0; i<data.length; i++){
				let tmp=data[i];
				//tr template 읽어오기
				let template = document.querySelector("#one").innerText;
				//template에 tmp의 값을 넣고 결과 문자열을 back tick으로 감싸서 얻어내고 trs에 누적
				let result=eval('`'+template+'`');
				trs += result;				
			}
			//trs를 html로 해석하여 tbody에 넣기
			document.querySelector("tbody").innerHTML=trs;
		});
		ajaxPromise("ajax_pagination.jsp", "get", "pageNum="+pageNum)
		.then(function(response){
			return response.text();
		})
		.then(function(data){
			document.querySelector(".pagination").innerHTML=data;
		});
	}
	//page move
	function movePage(pageNum){
		history.pushState(pageNum,"","?pageNum="+pageNum);
		pageUpdate(pageNum);
	};
	window.onpopstate=function(event){
		//pushState에서 전달한 data 즉 pageNum = event.state
		pageUpdate(event.state);
	}
	//삭제 
	function deleteConfirm(num){
		ajaxPromise("ajax_delete.jsp","post",{num:num})
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			if(data.isSuccess){
				pageUpdate(currentPage);
			}else{
				alert("failed to delete");	
			}			
		});
	};
	//추가
	document.querySelector("#insertSaveBtn").addEventListener("click",function(){
		//ajax 요청
		ajaxFormPromise(document.querySelector("#insertForm")).
		then(function(response){
			return response.json();
		}).
		then(function(data){
			if(data.isSuccess){
				pageUpdate(currentPage);
			}else{
				alert("failed to insert");
			}
		});
	});
	//수정
	function updateMember(num){
		//데이터 가져오기
		ajaxPromise("ajax_get_data.jsp","get","num="+num)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			let modal=new bootstrap.Modal(document.querySelector("#updateModal"));
			modal.show();
			document.querySelector("#updateModal [name=num]").value=data.num;
			document.querySelector("#updateModal #num").value=data.num;
			document.querySelector("#updateModal [name=content]").value=data.content;
			document.querySelector("#updateModal [name=regdate]").value=data.regdate;
			document.querySelector("#updateModal #regdate").value=data.regdate;
		});		
	};
	//저장버튼 누르면 수정내용 적용
	document.querySelector("#updateSaveBtn").addEventListener("click",function(){
		ajaxFormPromise(document.querySelector("#updateForm"))
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			if(data.isSuccess){
				pageUpdate(currentPage);
			}else{
				alert("failed to update");
			}
		});
	});
	
	</script>
</body>
</html>









