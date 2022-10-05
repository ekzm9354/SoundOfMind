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
<link rel="stylesheet" href="/resources/assets/css/sendfeedback.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>



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
						<c:if test="${user==null && Kakao == null}">
							<li><a href="login.do"><span class="label">Login</span></a></li>
							<li><a href="join.do"><span class="label">Sign Up</span></a></li>
						</c:if>
						<c:if test="${user!=null && Socail == null}"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">Logout</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
						<c:if test="${user==null && Kakao != kakao}">
							${id}님
							<li><a href="logout.do"><span class="label">Logout</span></a></li>
						</c:if>
					</ul>

				</header>
				<!-- sendfeedback -->
				<div class="back"></div>
				<div class="registration-form">
					<header>
						<h1>Sign Up</h1>
						<p>Fill in all informations</p>
					</header>
					<form>
						<div class="input-section email-section">
							<input class="email" type="email"
								placeholder="ENTER YOUR E-MAIL HERE" autocomplete="off" />
							<div class="animated-button">
								<span class="icon-paper-plane"><i
									class="fa fa-envelope-o"></i></span><span class="next-button email"><i
									class="fa fa-arrow-up"></i></span>
							</div>
						</div>
						<div class="input-section password-section folded">
							<input class="password" type="password"
								placeholder="ENTER YOUR PASSWORD HERE" />
							<div class="animated-button">
								<span class="icon-lock"><i class="fa fa-lock"></i></span><span
									class="next-button password"><i class="fa fa-arrow-up"></i></span>
							</div>
						</div>
						<div class="input-section repeat-password-section folded">
							<input class="repeat-password" type="password"
								placeholder="REPEAT YOUR PASSWORD HERE" />
							<div class="animated-button">
								<span class="icon-repeat-lock"><i class="fa fa-lock"></i></span><span
									class="next-button repeat-password"><i
									class="fa fa-paper-plane"></i></span>
							</div>
						</div>
						<div class="success">
							<p>ACCOUNT CREATED</p>
						</div>
					</form>
				</div>
			<!-- sendfeedback -->




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
								<li><a href="news.do">NEWS</a></li>
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
		function speaker() {
			$.ajax({
				url : "http://127.0.0.1:5000/stt",
				data : {
					num : 1
				},
				success : function(text) {
					console.log(text)
					$('input[name=inputSTT]').attr('value', text)
				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>
	
	
	
	<!-- sendfeedback js -->
	<script type="text/javascript">
	$('.email').on("change keyup paste",
			  function(){
			    if($(this).val()){
			      $('.icon-paper-plane').addClass("next");
			    } else {
			      $('.icon-paper-plane').removeClass("next");
			    }
			  }
			);

			$('.next-button').hover(
			  function(){
			    $(this).css('cursor', 'pointer');
			  }
			);

			$('.next-button.email').click(
			  function(){
			    console.log("Something");
			    $('.email-section').addClass("fold-up");
			    $('.password-section').removeClass("folded");
			  }
			);

			$('.password').on("change keyup paste",
			  function(){
			    if($(this).val()){
			      $('.icon-lock').addClass("next");
			    } else {
			      $('.icon-lock').removeClass("next");
			    }
			  }
			);

			$('.next-button').hover(
			  function(){
			    $(this).css('cursor', 'pointer');
			  }
			);

			$('.next-button.password').click(
			  function(){
			    console.log("Something");
			    $('.password-section').addClass("fold-up");
			    $('.repeat-password-section').removeClass("folded");
			  }
			);

			$('.repeat-password').on("change keyup paste",
			  function(){
			    if($(this).val()){
			      $('.icon-repeat-lock').addClass("next");
			    } else {
			      $('.icon-repeat-lock').removeClass("next");
			    }
			  }
			);

			$('.next-button.repeat-password').click(
			  function(){
			    console.log("Something");
			    $('.repeat-password-section').addClass("fold-up");
			    $('.success').css("marginTop", 0);
			  }
			);
	</script>

</body>
</html>