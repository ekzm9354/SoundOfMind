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
<!-- 카카오 javascriptSDK -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('0e90ffc2b83bed9cbdd0b545402d1987'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<!-- 네이버 javascriptSDK -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
				
				
						<div style="margin: 0 auto; display: table;">
							<!-- 카카오 로그인버튼 -->
							<a id="kakao-login-btn" href="javascript:loginWithKakao()"
								style="display: inline-block;"> <img
								src="/resources/assets/img/kakao.png" width="40" height="40"
								alt="카카오 로그인 버튼" style="margin-right: 10px;" /></a>
							<div id="naver_id_login" style="display: inline-block;"></div>
						</div>
				
				
				
			</div>
		</div>
	</div>	
	


		<script src="/resources/assets/js/login.js"></script>
		<script type="text/javascript">
			function loginWithKakao() {
				Kakao.Auth.authorize({
					redirectUri : 'http://localhost:8085/KakoLogin',
				});
			}
		</script>
		<script type="text/javascript">
			var naver_id_login = new window.naver_id_login(
					"hWpTeIKVxZ06AslRia4v", "http://localhost:8085/NaverLogin")
			naver_id_login.init_naver_id_login();
		</script>
</body>
</html>