<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
//한 페이지에 몇개의 row를 표시할 것인지
final int PAGE_ROW_COUNT = 5;
//페이지 개수를 몇 개 표시할 것인지
final int PAGE_DISPLAY_COUNT = 5;
//페이지 번호 초기값 지정
int pageNum=1;
//페이지 번호를 파라미터로 가져오기
String strPageNum = request.getParameter("pageNum");
//파라미터 값이 null이 아닐 때 페이지 번호를 이 값으로 지정
if(strPageNum!=null){
	pageNum=Integer.parseInt(strPageNum);
}
//페이지 시작과 끝 값을 일반식으로 작성하여 dto에 넣는다
int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
int endRowNum = pageNum*PAGE_ROW_COUNT;
TodoDto dto=new TodoDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

//할일 목록을 출력해 줘야 한다. 
//dao의 참조값을 가지고 와서 목록으로 출력한다. 
TodoDao dao=TodoDao.getInstance();
List<TodoDto> list=dao.getList(dto); //설정한 start/end row number를 dto에 넣어서 list에 전달

int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;

//전체 row 개수
int totalRow=dao.getCount();
//전체 page 개수
int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
//페이지의 끝번호가 전체 page 개수보다 크면 전체 페이지 개수를 페이지의 끝번호에 대입
if(totalPageCount < endPageNum){
	endPageNum = totalPageCount;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.page-ui a{
		text-decoration :none;
		color: black;
	}
	.page-ui a:hover{
		text-decoration:underline;
	}
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type: none;
		padding : 0;
	}
	.page-ui ul > li{
		float:left;
		padding: 4px;
	}

</style>
</head>
<body>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>
	<div class="container mt-4">
		<!-- 할일을 추가할 링크 + 할일 목록을 출력할 표를 작성한다.  -->
		<h1 class="p-3 mb-2 bg-primary text-white">To-do list</h1>
		<a href="insertform.jsp">
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
			<!-- 반복해서 출력해 줄 for문. 반복문에서 사용한 tmp로 값을 가져온다. 수정/삭제 링크도 건다-->
			<%for(TodoDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getContent() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<a href="updateform.jsp?num=<%=tmp.getNum()%>">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg>
						</a>
					</td>
					<!--  삭제시 선택된 num으로 이동-->
					<td>
						<a href="delete.jsp?num=<%=tmp.getNum()%>">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
						  		<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
							</svg>
						</a>
					</td>
				</tr>
			<%} %>
			</tbody>
		</table>
		<div class="page-ui clearfix">
			<ul>
				<%if(startPageNum!=1){ %>
					<li>
						<a href="list.jsp?pageNum=<%=startPageNum-1%>">&laquo;</a>
					</li>	
				<%} %>				
					<%for(int i=startPageNum; i<=endPageNum; i++) {%>
						<li>
							<%if(pageNum==i){ %>
								<a class="active" href="list.jsp?pageNum=<%=i%>"><%=i%></a>
							<%}else{ %>
								<a href="list.jsp?pageNum=<%=i%>"><%=i%></a>
							<%} %>
						</li>
					<%} %>
				<% if(totalPageCount > endPageNum){ %>
					<li>
						<a href="list.jsp?pageNum=<%=endPageNum+1%>">&raquo;</a>
					</li>
				<%} %>
			</ul>			
		</div>			
	</div> <!-- container end -->
</body>
</html>



