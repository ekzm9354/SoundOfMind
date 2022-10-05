<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html>
<head>
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/mypage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="is-preload">
<c:if test="${user==null}">
		<jsp:forward page="login.jsp"></jsp:forward></c:if>
	<c:if test="${user!=null}">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of Mind
					</a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">로그인</span></a></li>
							<li><a href="join.do"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>
				</header>


				<section id="banner">
					<div class="content">
						<header>
							<h1>My Page</h1>

						</header>
						<div class="uploadDiv">
							<input type="file" name="uploadFile" multiple>
						</div>		
						<div class="uploadResult">
							<!--  <div  id="result_card">
								<div class="imgDeleteBtn">X</div>
								<img src="/display?fileName=test.png">
							</div> -->
						</div>				
						<button id="uploadBtn">Upload</button>
						
						<table class="type03">
							<tr>
								<th scope="row">ID</th>
								<td>${user.id}</td>
							</tr>
							<tr>
								<th scope="row">Name</th>
								<td>${user.name}</td>
							</tr>
						</table>
						<table class="type03">
							<tr>
								<th scope="row">번호</th>
								<td>날짜</td>
								<td>내용</td>
								<td>감정</td>
							</tr>
							<c:forEach var="emotion" items="${emotion}">
								<tr>
									<th scope="row">${emotion.rownum}</th>
									<td>${emotion.date}</td>
									<td>${emotion.text}</td>
									<td>${emotion.emotions}</td>
								</tr>
							</c:forEach>
						</table>
						<button type="button" onclick="deletemem()">탈퇴하기</button>
						<%-- <a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a> --%>
					</div>

				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><span class="opener">COMMUNITY</span>
							<ul>
								<li><a href="community.do">BOARD</a></li>
								<li><a href="news.do">NEWS</a></li>
								<li><a href="chatting.do">CAHTTING</a></li>
							</ul></li>
						<li><a href="mypage.do">MY PAGE</a></li>
						<!--폰트 셋팅 부분-->
						<li><span class="opener" id="switcher">FONT SIZE</span>
							<ul>
								<li><span id="switcher-large">크게</span></li>
								<li><span id="switcher-small">작게</span></li>
							</ul></li>
						<li><a href="elements.html">SEND FEEDBACK</a></li>
						<li><a href="socket">Web Socket</a></li>
					</ul>
				</nav>

			</div>
		</div>
		</c:if>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/mypage.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		
			//var cloneOjb=$(".uploadDiv").clone();
			//이미지 업로드
			$("#uploadBtn").on("click", function(e){
				
				/* 이미지 존재시 삭제 */
				if($(".imgDeleteBtn").length > 0){
					deleteFile();
				}
				
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']");
				var fileList=inputFile[0].files;
				var fileObj=fileList[0];

				
				/* if(!fileCheck(fileObj.name, fileObj.size)){
					return false;
				} */
				formData.append("uploadFile",fileObj);
				
				$.ajax({
					url:'/uploadAjaxAction',
					processData:false,
					contentType:false,
					data : formData,
					type:"POST",
					dataType:'json',
					success:function(result){
						console.log('ajax'+result);
						showUploadImage(result);
						//input 부분 초기화
						//$(".uploadDiv").html(cloneOjb.html());
					},
					error:function(result){
						alert("이미지 파일이 아닙니다.")
					}
			});//ajax 끝부분
				
		});//onclick 끝부분 
			
			//파일 확장자제한, 파일 사이즈 제한
			var regex=new RegExp("(.*?)\.(jpg|png)$");
			var maxSize = 5242880; //5MB
			
			function fileCheck(fileName,fileSize){
				if(fileSize>=maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				if(!regex.test(fileName)){
					alert("허용되지 않는 확장자");
					return false;
				}
				return true;
			}
			
		</script>
		
		<script>
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			console.log("showUploadImage");
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			
			let fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName;
		
			$('.uploadResult').append("<div id='result_card'><div class='imgDeleteBtn' data-file='"+fileCallPath+"'>X</div></div>")
			$('.imgDeleteBtn').last().append("<img src='/display?fileName="+fileCallPath+"'>")
			
			
	        
		}	
		/* 이미지 삭제 버튼 동작 */
		$(".imgDeleteBtn").on("click", function(e){
			
			deleteFile();
			
		});
		
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		</script>


		<script>
		/* 회원탈퇴  */
			function deletemem() {
				if (!confirm("정말로 탈퇴하시겠습니까?")) {
					return "mypage.do";
				} else {
					alert("탈퇴 되었습니다.");
					location.replace("delete.do?id=${user.id}")
					return "delete.do";
				}
			}
		</script>
		
</body>
</html>