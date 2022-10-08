<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sound of Mind</title>
<meta charset="utf-8" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />

<!-- chat -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
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
										<br>
										<!-- disconnection 버튼 -->
										<a class="btn btn-xs btn-secondary" href="#" data-abc="true"
											style="background-color: white; border-radius: 3px;"
											onclick="disconnectButton_onclick()" id="disconnectButton">종료</a>
									</div>


									<div
										class="ps-container ps-theme-default ps-active-y chatBoxArea"
										id="chat-content"
										style="overflow-y: scroll !important; height: 400px !important; border: solid 1px;">


										<!-- 상대가 보낸것 -->
										<div class="media media-chat">
											<div class="media-body">
												<p style="background-color: #fdeca6; color: black;">안녕나는
													수디야</p>
											</div>
										</div>

										<!-- 내가 보낸것 -->
										<div class="media media-chat media-chat-reverse">
											<div class="media-body">
												<p id="output">안녕나는 수망이야~~~~~~~~~~~~~~</p>
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
								</div>
								<div class="publisher bt-1 border-light"
									style="background-color: #6495ED; border-radius: 3px;">
									<!-- 메세지 입력하는 곳 -->
									<input class="publisher-input" type="text" id="inputMsgBox"
										placeholder="메세지를 입력하세요."
										onkeypress="inputMsgBox_onkeypress()">

									<!-- 전송버튼 -->
									<a class="publisher-btn text-info" href="#" data-abc="true">
										<img src="/resources/assets/img/send7.png"
										style="width: 100%; height: 40px;"
										onclick="sendButton_onclick()" id="sendButton">
									</a>
									<!-- 전송버튼 end -->

								</div>

							</div>
						</div>
					</div>
				</div>

				<!-- chat code end -->

				<!-- <input id="inputMsgBox" style="width: 250px;" type="text"
					onkeypress="inputMsgBox_onkeypress()"> <input
					id="sendButton" value="send" type="button"
					onclick="sendButton_onclick()"> 
					<input
					id="disconnectButton" value="Disconnect" type="button"
					onclick="disconnectButton_onclick()">

				<textarea id="chatBoxArea" style="width: 100%" rows="10" cols="50"
					readonly="readonly"></textarea> -->


			</div>
		</div>
	</div>



	<!-- 수망 js -->


	<script type="text/javascript">
	var wsURL = null;
		window.onload = function(){
			wsURL = new WebSocket("ws://localhost:8085/websocket")
		
	<!-- 접속-->
	 wsURL.onopen = function(message){
		addLineToChatBox("Sever is connected")
	} 
	<!--메세지 수신 하는경우 -->
	wsURL.onmessage = function(message){
		addLineToChatBox(message.data)
	}
	<!-- 접속 해제-->
	wsURL.onclose = function(message){
		addLineToChatBox("Sever is disconnected")
	}
	<!-- 에러 발생 -->
	wsURL.onerror = function(message){
		addLineToChatBox("Error")
	 }
		}
	<!--채팅 영역 내용 한줄 추가 -->
	function addLineToChatBox(_line){
		if(_line == null){
			_line ='';
		}
		var chatBoxArea = document.getElementByClass('chatBoxArea');
	    chatBoxArea.value += _line + "\n";
	    chatBoxArea.scrollTop = chatBoxArea.scrollHeight;    
	}
	function sendButton_onclick() {
	    var inputMsgBox = document.getElementById('inputMsgBox');
	    if (inputMsgBox == null || inputMsgBox.value == null || inputMsgBox.value.length == 0) {
	        return false;
	    }
	    
	    var chatBoxArea = document.getElementByClass('chatBoxArea');
	    
	    if (wsURL == null || wsURL.readyState == 3) {
	        chatBoxArea.value += 'Server is disconnected.\n';
	        return false;
	    }
	    <!-- 서버로 메시지 전송-->
	   
	    wsURL.send(inputMsgBox.value);
	    inputMsgBox.value = '';
	    inputMsgBox.focus();
	    
	    return true;
	}

	<!-- 서버로 메시지 전송 -->
	function disconnectButton_onclick() {
	    if (wsURL != null) {
	    	wsURL.close();    
	    }
	}

	<!-- 입력하는경우 호출 -->
	function inputMsgBox_onkeypress() {
	    if (event == null) {
	        return false;
	    }
	    
	    <!-- 엔터키 누를시 호출 -->
	    var keyCode = event.keyCode || event.which;
	    if (keyCode == 13) {
	        sendButton_onclick();
	    }
	}
	</script>


</body>
</html>