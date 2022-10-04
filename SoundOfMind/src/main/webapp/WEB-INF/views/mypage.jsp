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
						<input type="file" name="uploadFile" multiple />
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
</body>
</html>