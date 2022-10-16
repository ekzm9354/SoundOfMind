<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html>
<head>
<title>마음의 소리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/mypage.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 폰트 -->
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

</head>
<body class="is-preload">
	<c:if test="${user==null && Kakao == null && Naver == null}">
		<jsp:forward page="login.jsp"></jsp:forward></c:if>
	<c:if test="${user!=null}">
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Main -->
			<div id="main">
				<div class="inner">
					<!-- Header -->
					<header id="header">
						<a href="index.do" class="logo"><strong>마음의</strong> 소리 </a>
						<ul class="icons">
							<c:choose>
								<c:when test="${user==null && Kakao == null && Naver == null}">
									<li><a href="login.do"><span class="label">로그인</span></a></li>
									<li><a href="join.do"><span class="label">회원가입</span></a></li>
								</c:when>
								<c:when test="${user!=null && Social == null && Kakao == null}">
							${user.id}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
								</c:when>
								<c:when test="${user==null && Naver != null && Kakao == null}">
							${Naveremail}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
								</c:when>
								<c:when test="${user==null && Naver == null && Kakao != null}">
							${id}님 
								<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
								</c:when>
							</c:choose>
						</ul>
					</header>


					<section id="banner">
						<div class="content">
							<header>
								<h1 class="style-3" style="text-align: center;">프로필</h1>

							</header>
							<div class="uploadResult">
								<img src='/display?fileName=${profile_s}' class='profileImg'>
							</div>


							<label class="uploadDiv"> 프로필 변경 <input type="file"
								name="uploadBtn" multiple style="display: none;">
							</label>
							<p class="userId">${user.id}님</p>

							<hr class="hr1">
							<!-- 구분선  -->


							<div class="mypagebox">
								<button class="btm_image" id="membtn">
									<img class="mypageicon" src="/resources/images/user.png">회원정보
									보기
								</button>
								<button class="btm_image" id="myboard">
									<img class="mypageicon" src="/resources/images/board.png">내
									게시글 보기
								</button>
								<button class="btm_image" id="myemotion">
									<img class="mypageicon" src="/resources/images/emo.png">나의
									감정 보기
								</button>
								<button class="deletebtn" type="button">
									<img class="mypageicon" src="/resources/images/deleteme.png">회원탈퇴
									하기
								</button>
							</div>
							<!--회원정보 나타나는 칸  -->
							<div id="meminfo">
								<table class="type03">
									<tr>
										<th scope="row">아이디</th>
										<td>${user.id}</td>
									</tr>
									<tr>
										<th scope="row">이름</th>
										<td>${user.name}</td>
									</tr>
								</table>
							</div>

							<!--내가 쓴 게시글 목록 보는 칸-->
							<div id="memboard">
								<table class="type03">
									<tr>
										<th scope="row">번호</th>
										<th>날짜</th>
										<th>조회수</th>
										<th>제목</th>
										<th>아이디</th>
										<th>글삭제</th>
									</tr>
									<c:forEach var="storege" items="${storege}">
										<tr>
											<td scope="row">${storege.rownum}</td>
											<td>${storege.date}</td>
											<td>${storege.click}</td>
											<td>${storege.title}</td>
											<td>${storege.id}</td>
											<td><button onclick="DeleteStorege(${storege.s_index})">삭제</button></td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<!--감정 나타나는 칸  -->
							<div id="mememotion">
								<table class="type03">
									<tr class="tablebottom">
										<th scope="row">번호</th>
										<th>날짜</th>
										<th>내용</th>
										<th>감정</th>
									</tr>
									<c:forEach var="emotion" items="${emotion}">
										<tr>
											<td scope="row">${emotion.rownum}</td>
											<td>${emotion.date}</td>
											<td>${emotion.text}</td>
											<td>${emotion.emotions}</td>
										</tr>
									</c:forEach>

								</table>
							</div>
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
							<h2>메뉴</h2>
						</header>
						<ul>
							<li><span class="opener">커뮤니티</span>
								<ul>
									<li><a href="community.do">게시판</a></li>
									<li><a href="news.do">뉴스</a></li>
									<li><a href="chatting.do">채팅</a></li>
									<li><a href="map.do">가까운 복지관 찾기</a></li>
								</ul></li>
							<li><a href="mypage.do">프로필</a></li>
							<li><a href="sendFeedback.do">의견 보내기</a></li>
							<li><a href="socket">그룹 채팅</a></li>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr) {
		console.log("showUploadImage");
		/* 전달받은 데이터 검증 */
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return
		}

		/* var uploadResult = $("#uploadResult"); */

		var obj = uploadResultArr[0];

		var fileCallPath = obj.uploadPath.replace(/\\/g, '/') + "/s_"
			+ obj.uuid + "_" + obj.fileName;
		$.ajax({
			url: "profilePath",
			type: "post",
			data: {
				profile: fileCallPath,
				id: `${user.id}`,
			},
			success: function(res) {
				console.log("주소보내기" + res);
				$('.profileImg').remove()
				$('.uploadResult').append("<div id='result_card'></div>")
				$('.uploadResult').last().append(
					"<img src='/display?fileName=" + res
					+ "'class='profileImg'>")
			},
			error: function(e) {
				console.log(e);
			}

		});




	}

</script>
	<script>
	/*var cloneOjb=$(".uploadDiv").clone();
	이미지 업로드*/

	$("input[type='file']").on("change", function(e) {


		var formData = new FormData();
		var inputFile = $("input[name='uploadBtn']");
		var fileList = inputFile[0].files;
		var fileObj = fileList[0];


		formData.append("uploadFile", fileObj);

		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: "POST",
			dataType: 'json',
			success: function(result) {
				console.log('ajax' + result);
				showUploadImage(result);

			},
			error: function(result) {
				alert("이미지 파일이 아닙니다.")
			}
		});//ajax 끝부분

	});//on.change 끝부분
	</script>

	<script>
	//파일 확장자제한, 파일 사이즈 제한
	var regex = new RegExp("(.*?)\.(jpg|png)$");
	var maxSize = 5242880; //5MB

	function fileCheck(fileName, fileSize) {
		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
		if (!regex.test(fileName)) {
			alert("허용되지 않는 확장자");
			return false;
		}
		return true;
	}

</script>



	<script type="text/javascript">
	$(".deletebtn").click(function(){
		
	swal({
		title:'회원 탈퇴',
		text:'정말로 탈퇴하시겠습니까?',
		icon:'warning',
		buttons:["취소","탈퇴"],
		dangerMode: "탈퇴",
		
	}).then(result=>{
		if(result){
			swal('탈퇴 되었습니다.',{icon:'success'});
			location.replace('delete.do?id=${user.id}')
			return 'delete.do';
		}else{
			return 'mypage.do';
		}
		
	})
	})
	
	function DeleteStorege(s_index){
		console.log(s_index)
		$.ajax({
			url:"DeleteStorege.do",
			data:{
				s_index:s_index
			},
			type:"GET",
			success:function(res){
				if(res>0){
				alert('삭제되었습니다.')
				location.reload()
				}
				
			},
			error:function(e){
				alert('관리자에게 문의하세요.')
			},
		})

	}

</script>




</body>
</html>