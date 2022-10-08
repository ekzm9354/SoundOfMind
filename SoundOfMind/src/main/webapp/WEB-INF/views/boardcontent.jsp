<%@page import="java.util.Base64.Decoder"%>
<%@page import="org.python.icu.impl.number.Parse"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.springframework.boot.web.servlet.server.Encoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html>
<head>
<!-- 폰트 -->
<link href="https://webfontworld.github.io/NanumSquare/NanumSquare.css" rel="stylesheet">

<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/community.css" />
<!-- bootstrap -->

<style type="text/css">
#header {
	display: -moz-flex;
	display: -webkit-flex;
	display: -ms-flex;
	display: flex;
	border-bottom: #6495ED;
	padding: 6em 0 1em 0;
	position: relative;
}

.bg-dark {
	background-color: #6495ED !important;
}

.nav-link {
	display: initial;
	padding: 0.5rem 1rem;
	border-bottom: black;
	color: white !important;
}

.box {
	margin: 0 auto;
}

.actions.small {
	float: right;
}
</style>

</head>
<body class="is-preload">
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
						<c:if test="${user==null && Kakao == null && Naver == null}">
							<li><a href="login.do"><span class="label">로그인</span></a></li>
							<li><a href="join.do"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${user!=null && Social == null}"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
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




				<!-- 제목, 아이디, 등록일시, 조회수 -->


				<hr class="major" style="margin-top: 30px; margin-bottom: 5px;" />

				<!-- Content -->
				<section style="padding-top: 0px;">
					<header class="main" id="content">
						<h5>${storege.title}</h5>
						<p style="margin-bottom: 5px;">${storege.id}${storege.date}
							${storege.click}</p>
					</header>
					<hr class="major" style="margin-top: 5px; margin-bottom: 30px;" />

					<!-- Blockquote 내용 칸 -->
					<blockquote style="margin-bottom: 50px;">${storege.content}
					</blockquote>


					<!-- 전체 댓글 -->
					<header class="main" id="content">
						<h5 style="margin-bottom: 10px;">전체 댓글</h5>
					</header>
					<hr class="major" style="margin-top: 5px; margin-bottom: 30px;" />


					<!-- Break 댓글 조회 -->
					<c:forEach var="boardComent" items="${boardComent}">
						<div class="row">
							<div class="4u 12u$(medium)">
								<p>${boardComent.id}</p>
							</div>
							<div class="4u 12u$(medium)">
								<p>${boardComent.coments}</p>
							</div>
							<div class="4u$ 12u$(medium)">
								<p>
									<!-- 날짜임 -->
								</p>
							</div>
						</div>
					</c:forEach>




					<hr class="major" style="margin-top: 35px; margin-bottom: 20px;" />

					<!-- 댓글작성하기 -->
					<!-- Box -->
					<h5>WRITE</h5>
					<div class="row uniform">
						<div class="box" style="width: 100%;padding-top: 20px;padding-right: 20px;padding-left: 20px;padding-bottom: 15px;">
							<textarea name="demo-name" id="demo-name" placeholder="내용을 입력하세요" style="width: 100%; height: 122px; margin-bottom: 20px; resize: none;"></textarea>
							<!-- 업로드버튼 -->
							<ul class="actions small">
								<li><button class="button small"
										onclick="coment(`${storege.s_index}`)">Upload</button></li>
							</ul>
						</div>
					</div>



				</section>








			</div>
		</div>
		<!-- Sidebar. -->
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

				<!-- Footer. -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/jquery.dropotron.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		function board(s_index) {
			location.href = "board.do?s_index=" + s_index
		}
	</script>
	<script type="text/javascript">
		function coment(s_index) {
			console.log(s_index)
			var coments = $('#demo-name').val()
			console.log(coments)
			var id = `${user.id}`
			console.log(id)
			$.ajax({
				url : "coment.do",
				type : "POST",
				data : {
					storege_id : s_index,
					coments : coments,
					id : id
				},
				success : function(res) {
					console.log(res)
					window.location.reload();

				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>


	<!-- bootstrap js -->

</body>
</html>