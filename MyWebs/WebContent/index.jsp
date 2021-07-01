<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<jsp:include page="/include/resource.jsp"></jsp:include>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
/>
<style>
	h1{
		text-shadow: 3px 3px 3px gray;
	}
	.box{
		display: inline;
		border: 1px dottted gray;
		border-radius: 20% 10%;
		box-shadow: 10px 10px 10px 0 rgba(11,4,4,0.6);
	}
	 .wrapper{
      perspective: 500px;
      perspective-origin: 50% 50%;
      margin-top: 10px;
      border: 1px solid gray;
   }
   .cube{
      transform-style: preserve-3d;
      transform-origin: 50% 50%;
      position: relative;
      width: 400px;
      height: 400px;
      margin: 0 auto; /* 가운데 정렬 */
   }
   .wrapper > .cube > div{
      position: absolute;
      width: 400px;
      height: 400px;
      opacity: 0.8; /* 투명도 */
      background-color: #2e272f;
   }
   .cube img{
      width: 400px;
      height: 400px;
   }
   
   .control{
      /* 인라인 요소의 가운데 정렬 */
      text-align: center;
   }  
</style>
</head>
<body>
<div class="container mt-4 mb-4">
	<h1 class="animate__animated animate__heartBeat">★ 빵!! 부대에 오신 것을 환영합니다★</h1>
	<h4 class="box">카벙클 고인부대</h4>
	<%if(id!=null){ %>
		<p><%=id %> 님, 로그인 중입니다.</p>
		<p><a href="${pageContext.request.contextPath}/users/private/info.jsp">개인정보 수정</a></p>
	<%} %>
	<ul>
		<%if(id==null){ %>
			<li><a href="${pageContext.request.contextPath}/users/signup_form.jsp">부대가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/login_form.jsp">로그인</a></li>
		<%}else{ %>
			<li><a href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a></li>
		<%} %>
		<li><a href="${pageContext.request.contextPath}/message/list.jsp">게시판</a></li>
	</ul>
</div>
<div class="wrapper">
   <div class="cube">
      <div><img src="${pageContext.request.contextPath}/images/taemin1.jpg"></div> 
      <div><img src="${pageContext.request.contextPath}/images/taemin2.jpg"></div>
      <div><img src="${pageContext.request.contextPath}/images/taemin3.jpg"></div>
      <div><img src="${pageContext.request.contextPath}/images/taemin4.jpg"></div>
   </div>
</div>
<div class="control">
   <button id="prevBtn">&larr;</button>
   <button id="nextBtn">&rarr;</button>
</div>
<script>
	function getAngleNtz(n, width) {
	    var angle = Math.round(360 / n);
	    var tz = Math.round((width / 2) / Math.tan((angle * Math.PI) / (2 * 180)));
	    var obj = {
	      angle: angle,
	      tz: tz
	    };
	    return obj;
	 }
	//li 요소 전체 선택
	const lis=document.querySelectorAll("li");
	//반복문으로 li 요소에 eventListener 부여
	for(i=0; i<lis.length; i++){
		lis[i].addEventListener("mouseover",function(){
			this.style.transition="all 0.5s ease-out";
			this.style.fontWeight="bold";
			this.style.color="red";
			this.style.marginLeft="10px";
		})
	}
	for(i=0; i<lis.length; i++){
		lis[i].addEventListener("transitionend",function(){
			this.style.removeProperty("margin-left");
			this.style.removeProperty("font-weight");
			this.style.removeProperty("color");
		})
	}
   //배치할 모든 div 의 참조값을 배열에 담아오기  
   const divs = document.querySelectorAll(".wrapper > .cube > div"); 
   //div 가 몇개인지 배열의 방의 갯수 얻어오기
   const n=divs.length;
   
   const obj=getAngleNtz(n, 400);
   //tz 값과 angle 값 얻어오기 
   const tz=obj.tz;
   const angle=obj.angle;
   // 반복문 돌면서 n 개의 div 모두 배치하기
   for(let i=0; i<divs.length; i++){
	   divs[i].style.transform=
		   `rotateY(\${angle*i}deg) translateZ(-\${tz}px)`;
   }
   // .cube div 도 뒤로 밀어 놓기
   document.querySelector(".cube").style.transform=`translateZ(-\${tz}px)`;
   
   setTimeout(function(){
      // transition 적용
      document.querySelector(".cube").style.transition=
         "transform 0.5s ease-out";
   }, 500);
   
   
   let rY=0;
   
   document.querySelector("#prevBtn")
      .addEventListener("click", function(){
         rY += angle;
         document.querySelector(".cube").style.transform=
            `translateZ(-\${tz}px) rotateY(\${rY}deg)`;
      });
   document.querySelector("#nextBtn")
      .addEventListener("click", function(){
         rY -= angle;
         document.querySelector(".cube").style.transform=
            `translateZ(-\${tz}px) rotateY(\${rY}deg)`;
      });

</script>
</body>
</html>