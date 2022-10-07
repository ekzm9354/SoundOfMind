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
<link rel="stylesheet" href="/resources/assets/css/mouth.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>



</head>
<body class="is-preload" >
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
						<c:if test="${user==null && Kakao == null && Naver == null}">
							<li><a href="login.do"><span class="label">로그인</span></a></li>
							<li><a href="join.do"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${user!=null && Social == null}"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
						<c:if test="${user==null && Kakao != kakao}">
							${id}님
							<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
						<c:if test="${user==null && Naver != naver}">
							${Naveremail}님
							<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>

				</header>
				<!-- Banner -->
				<section id="banner">
					<!--글자 사이즈-->
					<div class="fontSize">
						<p>가</p>
						<ul class="sub">
							<li><span onclick="fontsizedown()" style="font-size: 0.5em;">가</span>
								<span onclick="fontsizeup1()" style="font-size: 1em;">가</span> <span
								onclick="fontsizeup2()" style="font-size: 1.5em;">가</span> <span
								onclick="fontsizeup3()" style="font-size: 2em;">가</span></li>
						</ul>
					</div>
					<div class="content" style="height: 450PX;">
						<!-- loading animation -->
						<!-- partial:index.partial.html -->
						<div class="main"  style="margin: 0 auto; display: inline-block;">
							<div class="monster">
								<div class="monster__face">
									<div class="monster__eyes">
										<div class="monster__eye"></div>
										<div class="monster__eye"></div>
									</div>
									<div class="monster__mouth">
										<div class="monster__top"></div>
										<div class="monster__bottom"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class='music'
							style="padding-top: 200px; padding-bottom: 200px;">
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
						</div> -->
						<br>
						<button onclick="speaker()">마이크</button>
					</div>


					<div class="content" style="height: 450px;">

						<input type="text" name="inputSTT"
							style="height: 150px; margin-bottom: 20px;" id="speech"
							placeholder="여기에 상대방이 한 말이 보여지는 부분"> <input type="text"
							style="height: 150px; margin-bottom: 20px;"
							placeholder="여기에 상대방의 말을 분석한 감정이 나오는 부분">

						<button>
							<a href="#">수정하기</a>
						</button>
						<button>
							<a href="#">감정분석하기</a>
						</button>
					</div>
				</section>

			</div>
		</div>
		<!-- Sidebar. -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>메뉴</h2>
					</header>
					<ul>
						<li><span class="opener">커뮤니티</span>
							<ul>
								<li><a href="community.do">게시판</a></li>
								<li><a href="news.do">뉴스</a></li>
								<li><a href="chatting.do">채팅</a></li>
								<li><a href="map.do">가까운 복지관 찾기</a></li>
							</ul></li>
						<li><a href="mypage.do">프로필</a></li>
						<li><a href="sendFeedback.do">의견 보내기</a></li>
						<li><a href="socket">Web Socket</a></li>
					</ul>
				</nav>

				
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
	<!-- 글자 크기 줄이기 -->
	<script>
	function fontsizedown(){
		document.getElementById("speech").style.fontSize="0.5em";
	}
	function fontsizeup1(){
		document.getElementById("speech").style.fontSize="1em";
	}
	function fontsizeup2(){
		document.getElementById("speech").style.fontSize="1.5em";
	}
	function fontsizeup3(){
		document.getElementById("speech").style.fontSize="2em";
	}
	</script>
	
	<script>
	let subToggle=true;
	$(".fontSize").click(()=>{
	  if(subToggle){
	    $(".sub").slideDown(500);
	  }else{
	    $(".sub").slideUp(500);
	  }
	  subToggle=!subToggle;
	});
	</script>
	


</body>
</html>