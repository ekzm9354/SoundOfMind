<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html lang="en">
<head>
<title>마음의 소리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/news.css" />
<link rel="stylesheet" href="/resources/assets/css/community2.css" />

<!-- bootsnipp -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">


</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main"  style="background-color: white;">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>마음의</strong> 소리
					</a>
					<ul class="icons">
						<c:if test="${user==null && Kakao == null && Naver == null}">
							<li><a href="login.do"><span class="label">로그인</span></a></li>
							<li><a href="join.do"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${user!=null && Social == null}"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
						<c:if test="${user==null && Kakao != kakao}">
							${id}님
							<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
						<c:if test="${user==null && Naver != naver}">
							${Naveremail}님
							<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>

				</header>
				
				
					<!-- 상단 메뉴  & 검색 -->
				<nav class="navbar navbar-expand navbar-light bg-white"
					style="height: 81px;">
					<div class="container">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item active"><a href="community.do" class="nav-link">
										<img src="/resources/assets/img/board.png" width="27px"
										height="27px">
										게시판
								</a></li>
								<li class="nav-item"><a href="news.do" class="nav-link"> <img
										src="/resources/assets/img/news3.png" width="27px"
										height="27px">
										뉴스
								</a></li>
								<li class="nav-item"><a href="chatting.do" class="nav-link"> <img
										src="/resources/assets/img/chat3.png" width="27px"
										height="27px">
										채팅
								</a></li>
							</ul>
							<!-- 검색 -->
							<section id="search" class="alt"
								style="width: 50%; margin-left: 20px; margin-right: 20px;">
								<form action="#">
									<input type="text" name="query" id="query" placeholder="검색"
										style="margin-top: 30px;" />
								</form>
							</section>
							<ul class="navbar-nav d-none d-md-block">
								<li class="nav-item"><a class="nav-link"> <img
										src="/resources/assets/img/write2.png" width="32px"
										height="32px" onclick="boardWrite()">
										글쓰기
								</a></li>
							</ul>
						</div>
					</div>
				</nav>
				


				<section id="banner">
					<div class="content">
						<header>
							<h1>뉴스</h1>

						</header>
						<!-- 여기부터 뉴스 나오는 칸 꾸미기는 나중에 하겠슴당~ 일단 틀만,,  -->
						<h2>긍정뉴스</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">날짜</th>
									<th scope="col">제목</th>
								</tr>

							</thead>
							<tbody>
								<c:forEach var="news1" items="${news1}">
									<tr>
										<th>${news1.rownum}</th>
										<th>${news1.date}</th>
										<th><a style="text-decoration-line:none; color: inherit;" href="${news1.url}">${news1.title}</a></th>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h2>부정뉴스</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">날짜</th>
									<th scope="col">제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="news2" items="${news2}">
									<tr>
										<th>${news2.rownum}</th>
										<th>${news2.date}</th>
										<th><a style="text-decoration-line:none; color: inherit;" href="${news2.url}">${news2.title}</a></th>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<h2>중립 뉴스</h2>
						<table>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">날짜</th>
									<th scope="col">제목</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="news3" items="${news3}">
									<tr>
										<th>${news3.rownum}</th>
										<th>${news3.date}</th>
										<th><a style="text-decoration-line:none; color: inherit;" href="${news3.url}">${news3.title}</a></th>
									</tr>
								</c:forEach>
							</tbody>
						</table>


						<!-- 여기부터 뉴스 나오는 칸  -->
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
</div>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/news.js"></script>
	
  <!-- bootsnipp -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("li.nav-item").click(function(e) {
				e.preventDefault();
				$(".nav-item").removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>


</body>
</html>
