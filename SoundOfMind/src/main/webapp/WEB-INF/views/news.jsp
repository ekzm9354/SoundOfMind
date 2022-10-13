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

<!-- 폰트 -->
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css"
	rel="stylesheet">

</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main" style="background-color: white;">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>마음의</strong> 소리 </a>
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
				<!-- 검색 -->
				<div id="search" class="alt">
					<form action="#">
						<input type="text" name="query" id="query" placeholder="검색"
							style="margin-top: 15px;" />
					</form>
				</div>



				<section id="banner">
					<div class="content">
						<header>
							<h2>
								긍정뉴스<img class="imgsize" src="/resources/images/posi.png">
							</h2>

							<ul class="board-list-title">
								<li class="txt-14">번호</li>
								<li class="txt-14">날짜</li>
								<li class="board-title-con txt-14">제목</li>
							</ul>

							<ul class="board-list">
								<c:forEach var="news1" items="${news1}">
									<li class="newsdata">
										<ul class="board-list-inner">
											<li class="board-num"><span class="tag-square red">${news1.rownum}</span>
											</li>
											<li><span class="tag">${news1.date}</span></li>
											<li class="board-title-con txt-l"><a
												style="text-decoration-line: none; color: inherit;"
												href="${news1.url}"> <span class="title-row2 txt-16"><span
														class="icon-lock"></span>${news1.title}</span>
											</a></li>
										</ul>

									</li>
								</c:forEach>
							</ul>
							<div style="text-align: center;">
								<a href="#" class="readmore">뉴스 더보기</a>
							</div>




							<hr>

							<h2>
								부정뉴스<img class="imgsize" src="/resources/images/nega.png">
							</h2>
							<ul class="board-list-title">
								<li class="txt-14">번호</li>
								<li class="txt-14">날짜</li>
								<li class="board-title-con txt-14">제목</li>
							</ul>

							<ul class="board-list">
								<c:forEach var="news2" items="${news2}">
									<li class="newsdata2">
										<ul class="board-list-inner">
											<li class="board-num"><span class="tag-square red">${news2.rownum}</span>
											</li>
											<li><span class="tag">${news2.date}</span></li>
											<li class="board-title-con txt-l"><a
												style="text-decoration-line: none; color: inherit;"
												href="${news2.url}"> <span class="title-row2 txt-16"><span
														class="icon-lock"></span>${news2.title}</span>
											</a></li>
										</ul>

									</li>
								</c:forEach>

							</ul>
							<div style="text-align: center;">
								<a href="#" class="readmore2">뉴스 더보기</a>
							</div>

							<hr>

							<h2>
								중립 뉴스<img class="imgsize" src="/resources/images/soso.png">
							</h2>
							<ul class="board-list-title">
								<li class="txt-14">번호</li>
								<li class="txt-14">날짜</li>
								<li class="board-title-con txt-14">제목</li>
							</ul>

							<ul class="board-list">
								<c:forEach var="news3" items="${news3}">
									<li class="newsdata3">
										<ul class="board-list-inner">
											<li class="board-num"><span class="tag-square red">${news3.rownum}</span>
											</li>
											<li><span class="tag">${news3.date}</span></li>
											<li class="board-title-con txt-l"><a
												style="text-decoration-line: none; color: inherit;"
												href="${news3.url}"> <span class="title-row2 txt-16"><span
														class="icon-lock"></span>${news3.title}</span>
											</a></li>
										</ul>

									</li>
								</c:forEach>

							</ul>
							<div style="text-align: center;">
								<a href="#" class="readmore3">뉴스 더보기</a>
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
								<c:choose>
									<c:when test="${user==null && Kakao == null && Naver == null}">
										<li><a href="login.do">채팅</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="chatting.do">채팅</a></li>
									</c:otherwise>
								</c:choose>
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




</body>
</html>
