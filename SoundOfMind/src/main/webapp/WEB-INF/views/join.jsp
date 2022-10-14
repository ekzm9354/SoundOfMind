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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet" href="/resources/assets/css/join.css" />

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>마음의</strong> 소리
					</a>

				</header>



				<div class="content">
					<form action="join.do" method="post" class="login-form">
						<h1>회원가입</h1>
						<div class="textb">
							<input type="text" id="id" name="id" oninput="checkId()" required>
							<div class="placeholder">아이디</div>
							<span class="id_ok">사용 가능한 아이디입니다.</span> <span
								class="id_already">이미 사용중인 아이디입니다.</span>
						</div>

						<div class="textb">
							<input type="password" name="pw" required>
							<div class="placeholder">비밀번호</div>
						</div>
						<div class="textb">
							<input type="text" name="name" required>
							<div class="placeholder">이름</div>
						</div>
						

						<button type="submit" class="btn fas fa-arrow-right" disabled></button>
						<a href="login.do">로그인 하러가기</a>
					</form>
				</div>



			</div>
		</div>
	</div>


	<script src="/resources/assets/js/join.js"></script>
	<script src="/resources/assets/js/jquery.min.js"></script>
</body>
</html>