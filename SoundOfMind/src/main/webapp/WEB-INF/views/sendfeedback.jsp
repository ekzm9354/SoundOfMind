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
<title>마음의 소리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main2.css" />
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
					<a href="index.do" class="logo"><strong>마음의</strong> 소리 </a>
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

				<!-- sendfeedback -->
				<div style="margin-top: 40px;">
					<div class="box"
						style="width: 100%; margin: 0 auto; height: 625px;">
						<textarea name="demo-name" id="demo-name" class="email"
							placeholder="이메일을 입력하세요" autofocus
							style="width: 50%; height: 60px; margin-bottom: 20px; resize: none;"></textarea>
						<textarea name="demo-name" id="demo-name" class="title"
							maxlength="50" placeholder="제목을 입력하세요" autofocus
							style="width: 100%; height: 60px; margin-bottom: 20px; resize: none;"></textarea>
						<textarea name="demo-name" id="demo-name" class="text"
							maxlength="1000" placeholder="내용을 입력하세요" autofocus
							style="width: 100%; height: 352px; margin-bottom: 20px; resize: none;"></textarea>

						<!-- 동의버튼 -->
						<input type="checkbox" id="demo-copy" name="demo-copy"> <label
							for="demo-copy">개인정보 수집 동의</label>
						<div class="6u 12u$(small)">
							<!-- 업로드버튼 -->
							<ul class="actions small">
								<li><button class="button small" onclick="SendFeedback()">의견
										보내기</button></li>
							</ul>
						</div>
					</div>
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
						<h2>메뉴</h2>
					</header>
					<ul>
						<li><span class="opener">커뮤니티</span>
							<ul>
								<li><a href="community.do">게시판</a></li>
								<li><a href="news.do">뉴스</a></li>
								<c:choose>
									<c:when test="${user==null && Kakao == null && Naver == null}">
										<li><a href="login.do">채팅</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="chatting.do">채팅</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="map.do">가까운 복지관 찾기</a></li>
							</ul></li>
						<li><a href="mypage.do">프로필</a></li>
						<li><a href="sendFeedback.do">의견 보내기</a></li>
						<li><a href="socket">그룹 채팅</a></li>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	<script type="text/javascript">
		function SendFeedback() {
			var email = $('.email').val()
			var title = $('.title').val()
			var text = $('.text').val()
			var check = $('#demo-copy').is(':checked')
			if (check == true) {
				if (email == '' || title == '' || text == '') {
					alert('미입력된 항목이 있습니다')
				} else {
					$
							.ajax({
								url : "feedback.do",
								data : {
									email : email,
									title : title,
									text : text
								},
								type : "POST",
								success : function() {
									swal({
										title : '전송되었습니다.',
										showClass : {
											popup : 'animate__animated animate__fadeInDown'
										},
										hideClass : {
											popup : 'animate__animated animate__fadeOutUp'
										}
									})
									$('.email').val('')
									$('.title').val('')
									$('.text').val('')
								},
								error : function(e) {
									console.log(e)
								}
							})
				}
			}else{
				alert('개인정보 수집에 동의해주세요')
			}
		}
	</script>



	<!-- sendfeedback js -->


</body>
</html>