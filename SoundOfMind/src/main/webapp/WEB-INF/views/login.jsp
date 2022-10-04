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
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet" href="/resources/assets/css/login_css.css" />
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

				</header>



				<div class="content">
					<form action="login.do" method="post" class="login-form">
						<h1>로그인</h1>
						<div class="textb">
							<input type="text" name="id" required>
							<div class="placeholder">아이디</div>
						</div>

						<div class="textb">
							<input type="password" name="pw" required>
							<div class="placeholder">패스워드</div>
							<div class="show-password fas fa-eye-slash"></div>

						</div>

						<button type="submit" class="btn fas fa-arrow-right" disabled></button>
						 <a href="join.do">회원가입</a>
					</form>

				</div>



			</div>
		</div>


		<script src="/resources/assets/js/login.js"></script>
		
</body>
</html>