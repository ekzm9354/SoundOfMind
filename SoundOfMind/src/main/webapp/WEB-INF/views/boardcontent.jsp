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
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/community.css" />
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">

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
    margin:0 auto;
}
.actions.small{
  float:right;
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
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">Login</span></a></li>
							<li><a href="join.do"><span class="label">Sign Up</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">Logout</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
					</ul>

				</header>


				<!-- 상단 메뉴  & 검색 -->
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
					style="height: 46px;">

					<div class="navbar-collapse collapse" id="navbarsExample05"
						style="">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item active"><a class="nav-link" href="#"
								style="height: 32px;">BOARD<span class="sr-only">(current)
								</span>
							</a></li>
							<li class="nav-item active"><a class="nav-link" href="#"
								style="height: 32px;">NEWS<span class="sr-only">(current)
								</span>
							</a></li>
							<li class="nav-item active"><a class="nav-link" href="#"
								style="height: 32px;">CHATTING<span class="sr-only">(current)
								</span>
							</a></li>
						</ul>
						<form class="form-inline my-2 my-md-0">
							<input class="form-control" type="text" placeholder="Search"
								style="height: 32px;">
						</form>
					</div>
				</nav>




			<!-- 제목, 아이디, 등록일시, 조회수 -->


				<hr class="major" style="margin-top: 30px; margin-bottom: 5px;" />

				<!-- Content -->
				<section style="padding-top: 0px;">
					<header class="main" id="content">
						<h5>제목</h5>
						<p style="margin-bottom: 5px;">여기는 이름과 / 작성일시 / 조회수</p>
					</header>
					<hr class="major" style="margin-top: 5px; margin-bottom: 30px;" />
					
					<!-- Blockquote 내용 칸 -->
					<blockquote style="margin-bottom: 50px;">Lorem ipsum
						dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit
						adipiscing eu felis iaculis volutpat ac adipiscing accumsan eu
						faucibus. Integer ac pellentesque praesent. Lorem ipsum dolor.
						Lorem ipsum dolor vestibulum ante ipsum primis in faucibus
						vestibulum. Blandit adipiscing eu felis iaculis volutpat ac
						adipiscing accumsan eu faucibus.</blockquote>


					<!-- 전체 댓글 -->
						<header class="main" id="content">
							<h5 style="margin-bottom: 10px;">전체 댓글</h5>
						</header>
					<hr class="major" style="margin-top: 5px; margin-bottom: 30px;" />
					
					
					<!-- Break 댓글 조회 -->
					<div class="row">
						<div class="4u 12u$(medium)">
							<p >아이디</p>
						</div>
						<div class="4u 12u$(medium)">
							<p>내용</p>
						</div>
						<div class="4u$ 12u$(medium)">
							<p>입력일시</p>
						</div>
					</div>
					
					
					

					<hr class="major" style="margin-top: 35px;margin-bottom: 20px;"/>

				<!-- 댓글작성하기 -->
					<!-- Box -->
					<h5>WRITE</h5>
					<div class="row uniform">
						<div class="box" style="width: 980px;">
							<textarea name="demo-name" id="demo-name"
								placeholder="내용을 입력하세요" style="width: 100%; height: 202px; margin-bottom: 20px; resize: none;">
							</textarea>
							<!-- 업로드버튼 -->
							<ul class="actions small">
								<li><a href="#" class="button small">Upload</a></li>
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
						<h2>MENU</h2>
					</header>
					<ul>
						<li><span class="opener">COMMUNITY</span>
							<ul>
								<li><a href="community.do">BOARD</a></li>
								<li><a href="#">NEWS</a></li>
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


	<!-- bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>

</body>
</html>