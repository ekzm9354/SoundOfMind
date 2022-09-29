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
<link rel="stylesheet" href="/resources/assets/css/setting.css" />
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
							<h1>Setting</h1>
						</header>
					<div id="fontSizeControllBox">
					<ul id="fontControll">
					<li><a href="#" id="larger" class='buttonadd'>글자 크게</a></li>
					<li><a href="#" id="smaller" class='buttonsub'>글자 작게</a></li>
					</ul>
					</div>
					<font class="article">
						
						
						

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
								<li><a href="#">NEWS</a></li>
								<li><a href="#">INFORMATION</a></li>
								<li><a href="#">CAHTTING</a></li>
							</ul></li>
						<li><a href="mypage.do">MY PAGE</a></li>
						<li><a href="setting.do">SETTING</a></li>
						<li><a href="elements.html">SEND FEEDBACK</a></li>
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
		<script src="/resources/assets/js/setting.js"></script>


</body>
</html>