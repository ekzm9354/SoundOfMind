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
					</ul>
				</header>


				<section id="banner">
					<div class="content">
						<header>
							<h1>My Page</h1>

						</header>

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


				<!-- Scripts -->
				<script src="/resources/assets/js/jquery.min.js"></script>
				<script src="/resources/assets/js/browser.min.js"></script>
				<script src="/resources/assets/js/breakpoints.min.js"></script>
				<script src="/resources/assets/js/util.js"></script>
				<script src="/resources/assets/js/mypage.js"></script>


				<script>
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
				</c:if>
</body>
</html>