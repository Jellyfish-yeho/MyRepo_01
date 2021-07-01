<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/info.jsp</title>
<style>
	#profileImage{
		width:100px;
		height:100px;
		border:1px solid red;
		border-radius: 50%;
	}
	#image{
		display:none;
	}

</style>
</head>
<body>
	<div class="container">
		<h1>개인 정보입니다.</h1>
		<table>
			<tr>
				<th>이름</th>
				<td>나</td>
			</tr>
			<tr>
				<th>프로필 이미지</th>
				<td>
					<a href="javascript:" id="profileLink">
						<img id="profileImage" src="../images/1.jpg" />

					</a>
				</td>
			</tr>
		</table>
		<input id="image" type="file" name="image" accept=".jpg, .JPG, .JPEG, .png, .gif" />
	</div>
	<script>
		document.querySelector("#profileLink").addEventListener("click",function(){
			document.querySelector("#image").click();
		});
		//이미지를 클릭했을 때 실행할 함수 등록
		document.querySelector("#image").addEventListener("change",function(){
		//then 전까지를 ajaxInputPromise("ajax_xxx.jsp",this)하면 된다.	
			let data=new FormData();
			//image라는 파라미터명으로 선택한 파일 객체를 FormData에 담는다.
			//즉, this = input type="file"
			data.append("image",this.files[0]);
			fetch("ajax_profile_upload.jsp",{
				method:"post",
				body:data
			})
			
			.then(function(response){
				return response.json()
			})
			.then(function(data){
				console.log(data);
				let imagePath="<%=request.getContextPath()%>/upload/"+data.saveFileName;
				document.querySelector("#profileImage").setAttribute("src",imagePath);
			});
		});
	</script>
</body>
</html>

