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
<link rel="stylesheet" href="/resources/assets/css/main.css" />
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>Sound</strong> of
						Mind </a>
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
							<h1>Storage</h1>

						</header>
						<c:if test="${user==null}">
							<jsp:forward page="login.jsp"></jsp:forward></c:if>
						<c:if test="${user!=null}">
							<table border="1">
								<tr>
									<td>번호</td>
									<td>날짜</td>
									<td>내용</td>
									<td>감정</td>
								</tr>
								<c:forEach var="emotion" items="${emotion}">
									<tr>
										<td>${emotion.rownum}</td>
										<td>${emotion.date}</td>
										<td>${emotion.text}</td>
										<td>${emotion.emotions}</td>
									</tr>
								</c:forEach>

							</table>
						</c:if>
						
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
						<li><span class="opener">Text</span>
							<ul>
								<li><a href="#">Size</a></li>
								<li><a href="#">Theme</a></li>
							</ul></li>
						<li><a href="emotion.do">Storage</a></li>
						<li><a href="mypage.do">My Page</a></li>
						<li><a href="elements.html">Send feedback</a></li>
					</ul>
				</nav>


				<!-- Scripts -->
				<script src="/resources/assets/js/jquery.min.js"></script>
				<script src="/resources/assets/js/browser.min.js"></script>
				<script src="/resources/assets/js/breakpoints.min.js"></script>
				<script src="/resources/assets/js/util.js"></script>
				<script src="/resources/assets/js/main.js"></script>
</body>
</html>