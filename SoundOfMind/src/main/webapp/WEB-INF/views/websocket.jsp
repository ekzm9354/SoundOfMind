<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마음의 소리</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<!-- chat -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" href="/resources/assets/css/websocket.css" />



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

				<!-- chat code -->
				<div class="page-content page-container" id="page-content">
					<div class="padding">
						<div class="row container d-flex justify-content-center">
							<div class="col-md-6" style="width: 100%;">
								<div class="card card-bordered">
									<div class="card-header" style="background-color: #6495ED;">
										<h4 class="card-title">
											<strong> 百聞不如一見 </strong>
										</h4>
										<!-- connection 버튼 -->
										<a class="btn btn-xs btn-secondary" href="#" data-abc="true"
											style="background-color: white; border-radius: 3px;">연결</a>
									</div>


									<div class="ps-container ps-theme-default ps-active-y"
										id="chat-content"
										style="overflow-y: scroll !important; height: 400px !important; border: solid 1px;">
										
										
									<!-- 상대가 보낸것 -->	
										<div class="media media-chat">
											<div class="media-body">
												<p style="background-color: #fdeca6; color:black;">안녕나는 수디야</p>
											</div>
										</div>
									
									<!-- 내가 보낸것 -->
										<div class="media media-chat media-chat-reverse">
											<div class="media-body">
												<p>안녕나는 수망이야~~~~~~~~~~~~~~</p>
											</div>
										</div>

										<div class="ps-scrollbar-x-rail"
											style="left: 0px; bottom: 0px;">
											<div class="ps-scrollbar-x" tabindex="0"
												style="left: 0px; width: 0px;"></div>
										</div>
										<div class="ps-scrollbar-y-rail"
											style="top: 0px; height: 0px; right: 2px;">
											<div class="ps-scrollbar-y" tabindex="0"
												style="top: 0px; height: 2px;"></div>
										</div>
									</div>

									<div class="publisher bt-1 border-light"
										style="background-color: #6495ED; border-radius: 3px;">
										<!-- 메세지 입력하는 곳 -->
										<input class="publisher-input" type="text" placeholder="메세지를 입력하세요.">
											
										<!-- 전송버튼 -->	
										 <a class="publisher-btn text-info" href="#" data-abc="true">
											<img src="/resources/assets/img/send7.png"
											style="width: 100%; height: 40px;">
										</a>
										<!-- 전송버튼 end -->	
										
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- chat code end -->


			<!-- 수민코드 -->
				<h1 style="text-align: center;">Hello World WebSocket</h1>
				<br>
				<div style="text-align: center;">
					<form action="">
						<input onclick="connect()" value="Connect" type="button">
						<input onclick="send_message()" value="Send" type="button">
						<input id="textID" name="message" value="Hello WebSocket!"
							type="text"><br>
					</form>
				</div>
				<div id="output"></div>
			<!-- 수민코드 -->


			</div>
		</div>
	</div>



	<!-- 수망 js -->


	<script type="text/javascript">
		var wsUri = "ws://localhost:8085/websocket";
		var websocket;
		var output;
		var textID
		function init() {
			output = document.getElementById("output");
			textID = document.getElementById("textID");
		}
		function connect() {
			if (!websocket) {
				websocket = new WebSocket(wsUri);
				websocket.onopen = function(evt) {
					onOpen(evt)
				};
				websocket.onmessage = function(evt) {
					onMessage(evt)
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};
			}
		}

		function disconnect() {
			if (!websocket)
				websocket.close();
		}

		/* function send_message() {
			var message = textID.value;
			writeToScreen("나: " + message);
			websocket.send(message);
		} */

		function onOpen(evt) {
			writeToScreen("Connected to Endpoint!");
		}

		function onMessage(evt) {
			writeToScreen("상대방: " + evt.data);
		}

		function onError(evt) {
			writeToScreen('ERROR: ' + evt.data);
		}

		function writeToScreen(message) {
			var pre = document.createElement("p");
			pre.style.wordWrap = "break-word";
			pre.innerHTML = message;
			output.appendChild(pre);
		}
		window.addEventListener("load", init, false);
	</script>


</body>
</html>