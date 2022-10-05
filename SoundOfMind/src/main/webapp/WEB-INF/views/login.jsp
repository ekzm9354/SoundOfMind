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
		<!-- 카카오 간편로그인 -->
		<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
			integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
			crossorigin="anonymous"></script>
		<script>
			Kakao.init('0e90ffc2b83bed9cbdd0b545402d1987'); // 사용하려는 앱의 JavaScript 키 입력
		</script>
		<!-- 로그인 버튼 -->
		<a id="kakao-login-btn" href="javascript:loginWithKakao()"> <img
			src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
			width="222" alt="카카오 로그인 버튼" />
		</a>
		<script type="text/javascript">
			function loginWithKakao(){
				Kakao.Auth.authorize({
					redirectUri: 'http://localhost:8085/test.do',
					scope:'profile_nickname',
				})
			}
		</script>
</body>
</html>