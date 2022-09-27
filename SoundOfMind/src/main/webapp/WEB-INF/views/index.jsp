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
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/loading.css" />
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
						<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
					</ul>

				</header>
				<!-- Banner -->
				<section id="banner">
					<div class="content" style="height: 554.3px;">
						<!-- loading animation -->
						<div class='music' style="padding-top: 200px; padding-bottom: 200px;">
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
							<div class='bar'></div>
						</div>
						<br>
						<button onclick="speaker()">마이크</button>
					</div>
					
					<div class="content" style="height: 554.3px;">

						<input type="text" style="height: 200px; margin-bottom: 20px;">
						<input type="text" style="height: 200px; margin-bottom: 20px;">
							
						<ul class="actions">
							<li><a href="#" class="button big">Revise</a></li>
							<li><a href="#" class="button big">Sentiment Analysis</a></li>
						</ul>
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
						<li><a href="storege.do">Storage</a></li>
						<li><a href="mypage.do">My Page</a></li>
						<li><a href="elements.html">Send feedback</a></li>
					</ul>
				</nav>

				<!-- Footer -->
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
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		function speaker() {
			console.log('e')
			$.ajax({
				url : "http://172.30.1.5:5000/",
				data : {
					ip : '127.0.0.1',
					num : 1
				},
				succes : console.log('success'),
				error : console.log('error')
			})
		}
	</script>

</body>
</html>