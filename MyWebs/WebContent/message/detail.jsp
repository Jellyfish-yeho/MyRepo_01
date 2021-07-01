<%@page import="java.util.List"%>
<%@page import="test.message.dao.MessageCommentDao"%>
<%@page import="test.message.dto.MessageCommentDto"%>
<%@page import="test.message.dto.MessageDto"%>
<%@page import="test.message.dao.MessageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//get 방식 파라미터로 전달된 글 번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	//조회수 올리는 메소드 실행
	MessageDao.getInstance().addViewCount(num);
	
	//dto 객체에 글번호 넣기
	MessageDto dto=new MessageDto();
	dto.setNum(num);
	
	//session 의 id 읽어오기
	String id=(String)session.getAttribute("id");
	//로그인 여부
	boolean isLogin=false;
	if(id!=null){
		isLogin=true;
	}
		
	//댓글 페이징 처리 로직
	
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//1페이지 댓글 내용출력
	int pageNum=1;

	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//댓글 list 가지고 오기 : 원글의 글 번호 사용
	MessageCommentDto commentDto=new MessageCommentDto();
	commentDto.setRef_group(num);
	
	//1페이지에 해당하는 rownum을 각각 dto에 담는다
	commentDto.setStartRowNum(startRowNum);
	commentDto.setEndRowNum(endRowNum);
	//1페이지 댓글 목록을 select 
	List<MessageCommentDto> commentList
	=MessageCommentDao.getInstance().getList(commentDto);
	
	//글 번호로 댓글의 전체 row의 개수 얻기
	int totalRow=MessageCommentDao.getInstance().getCount(num);
	//전체 페이지의 개수
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/message/detail.jsp</title>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.comments .comment-form{
		display: none;
	}
	.comments li{
		position: relative;
	}
	.comments .reply-icon{
		position: absolute;
		top: 1em;
		left: 1em;
		color: gray;
	}

</style>
</head>
<body>
	<div class="container">
		<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><%=dto.getCategory() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>	
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>	
			<tr> 
				<td colspan="2">
					<textarea cols="60" rows="10"><%=dto.getContent() %></textarea>
				</td>
			</tr>	
			<tr> 
				<td colspan="2">
					<%if(dto.getImage()!=null){ %>
						<img id="image" src="<%=request.getContextPath() %><%=dto.getImage()%>" width="500px" height="500px"/>
					<%} %>
				</td>
			</tr>							
		</table>
		<ul>
			<li>
				<a href="${pageContext.request.contextPath}/message/list.jsp">목록으로</a> 
			</li>
			<%--작성자와 id가 일치할 때만 수정/삭제 출력 --%>
			<%
			if(dto.getWriter().equals(id)){ %>
				<li>
					<a href="${pageContext.request.contextPath}/message/private/update_form.jsp?num=<%=dto.getNum()%>">수정</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/message/private/delete.jsp?num=<%=dto.getNum()%>">삭제</a>
				</li>
			<%} %>
		</ul>
		<div class="comments">
			<ul>
			<%for(MessageCommentDto tmp:commentList){ %>
				<%-- 삭제된 경우 삭제되었다는 표기하기 : getDeleted 값이 yes 일 때 --%>
				<%if(tmp.getDeleted().equals("yes")){%>
				<li>삭제된 댓글입니다. </li>
				<% //아래를 수행하지 않고 for 문 다시 실행
					continue;
				}%>
				
				<%-- 대댓글인 경우 들여쓰기 --%>
				<%if(tmp.getNum()==tmp.getComment_group()){%>
				<li id="reli<%=tmp.getNum()%>">
				<%}else{%>
				<li id="reli<%=tmp.getNum()%>" style="padding-left:50px">
				<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
				</svg>
				<%}%>
					<dl> 
						<%if(tmp.getProfile()==null){ %>
						<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
							<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
							<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						</svg>
						<%}else{ %>
						<img src="${pageContext.request.contextPath}/<%=tmp.getProfile()%>"/>
						<%} %>
						<%-- 대댓글 링크 --%>
						<a data-num="<%=tmp.getNum()%>" href="javascript:" class="reply-link">댓글</a>
						<%-- 삭제, 수정 링크 : id가 null이 아니면서 writer과 일치할 때 --%>
						<%if(id!=null && tmp.getWriter().equals(id)){ %>
							<a data-num="<%=tmp.getNum()%>" href="javascript:" class="update-link">수정</a>
							<a data-num="<%=tmp.getNum()%>" href="javascript:" class="delete-link">삭제</a>
						<%}%>
						</dt>
						<dd>
							<pre id="pre<%=tmp.getNum()%>"><%=tmp.getContent() %></pre>
						</dd>
					</dl>
					<%-- 댓글 수정 폼 --%>
					<%if(tmp.getWriter().equals(id)){ %>
					<form id="updateForm<%=tmp.getNum()%>" class="animate__animated update-form comment-form"
					action="private/comment_update.jsp" method="post">
						<input type="hidden" name="num" value="<%=tmp.getNum()%>"/>
						<textarea name="content"><%=tmp.getContent()%></textarea>
						<button type="submit">수정</button>
					</form>
					<%}%>
					<%-- 대댓글 폼 --%>
					<form id="reForm<%=tmp.getNum()%>" class="animate__animated comment-form" 
					action="private/comment_insert.jsp" method="post">
						<input type="hidden" name="ref_group" value="<%=dto.getNum()%>"/>
						<input type="hidden" name="target_id" value="<%=tmp.getWriter()%>"/>
						<input type="hidden" name="comment_group" value="<%=tmp.getComment_group() %>"/>
						<textarea name="content"></textarea>
						<button type="submit">댓글</button>
					</form>
				</li>
			<%}%>
			</ul>
			</div>
		<form action="private/comment_insert.jsp" method="post">
			<input type="hidden" name="ref_group" value="<%=num%>"/>
			<input type="hidden" name="target_id" value="<%=dto.getWriter() %>" />
			<textarea name="content" ></textarea>
			<button type="submit">댓글</button>
		</form>
	</div>
<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
<script>
	
	

	//삭제 링크의 참조값을 배열에 담아와서 ajax 요청하기
	let deleteLinks=document.querySelectorAll(".delete-link");
	for(let i=0; i<deleteLinks.length; i++){
		deleteLinks[i].addEventListener("click",function(){
		//링크 클릭 시 해당 요소의 data-num 속성의 value값을 이용해서 삭제
			const num=this.getAttribute("data-num");
			const isDelete=confirm("정말 삭제하시겠습니까?");
			if(isDelete){
				//ajax요청으로 삭제
				ajaxPromise("private/comment_delete.jsp","post","num="+num)
				.then(function(response){
					return response.json();
				})
				.then(function(data){
					//삭제 성공 시 댓글이 있는 li 요소에 "삭제된 댓글입니다." 출력 
					if(data.isSuccess){
						document.querySelector("#reli"+num).innerText="삭제된 댓글입니다.";
					}
				});
			}
		});
	}

	//댓글 수정 폼의 참조값 담아와서 제출됐을 때 ajax 요청하도록 하기
	let updateForms=document.querySelectorAll(".update-form");
	for(let i=0; i<updateForms.length; i++){
		updateForms[i].addEventListener("submit",function(e){
			//폼의 참조값을 if문 안에서도 쓰기 위해서 정의
			const form=this;
			e.preventDefault();
			ajaxFormPromise(this)
			.then(function(response){
				return response.json();
			})
			.then(function(data){ //data는 {isSuccess:true/false}
				if(data.isSuccess){ //update가 성공했다면
					//수정한 폼에 입력한 value값을 pre에 출력해야 한다. 
					//폼의 num 값 = pre 요소의 num 값
					const num=form.querySelector("input[name=num]").value;
					const content=form.querySelector("textarea[name=content]").value;
					document.querySelector("#pre"+num).innerText=content;
					//완료되면 폼을 닫는다.
					form.style.display="none";
				}
			});
		})
	}

	//댓글 수정 링크 누르면 나타나도록 
	let updateLinks = document.querySelectorAll(".update-link");
	for(let i=0; i<updateLinks.length; i++){
		updateLinks[i].addEventListener("click",function(){
			const num=this.getAttribute("data-num");
			const form=document.querySelector("#updateForm"+num);
			let currentText=this.innerText;
			if(currentText=="수정"){
				form.style.display="block";
				form.classList.add("animate__fadeInDown");
				this.innerText="취소";
				form.addEventListener("animationend",function(){
					form.classList.remove("animate__fadeInDown");
				},{once:true})
			}else if(currentText=="취소"){
				form.classList.add("animate__fadeOutDown");
				this.innerText="수정";
				form.addEventListener("animationend",function(){
					form.classList.remove("animate__fadeOutDown");
					form.style.display="none";
				},{once:true})
			}
		});
	}

	//대댓글 링크 참조값 가져오기
	let replyLinks = document.querySelectorAll(".reply-link");
	//반복문 돌면서 이벤트 등록 : 클릭 시 display block
	for(let i=0; i<replyLinks.length; i++){
		replyLinks[i].addEventListener("click", function(){
			//댓글에 인접한 해당 폼을 열어야 함 => click 이벤트가 일어난 그 댓글 링크의 data-num 속성의 value를 읽어온다. 
			const num=this.getAttribute("data-num");
			//num에 해당하는 폼의 참조값을 가져온다
			const form=document.querySelector("#reForm"+num);
			//현재 링크의 문자열을 읽어와서 댓글 / 취소로 분기
			let currentText=this.innerText;
			if(currentText=="댓글"){
				//해당하는 폼을 보이게 한다.
				form.style.display="block";
				//animate 추가
				form.classList.add("animate__fadeInDown");
				//innerText 변경
				this.innerText="취소";
				//애니메이션이 끝나면 제거
				form.addEventListener("animationend",function(){
					form.classList.remove("animate__fadeInDown");
				},{once:true})
			}else if(currentText=="취소"){
				//애니메이션 추가
				form.classList.add("animate__fadeOutDown");
				//innerText 변경
				this.innerText="댓글";
				//애니메이션이 끝나면 제거, 폼 안보이게 하기
				form.addEventListener("animationend",function(){
					form.classList.remove("animate__fadeOutDown");
					form.style.display="none";
				},{once:true})
			}
			
		})
	}
	
</script>
</body>
</html>







