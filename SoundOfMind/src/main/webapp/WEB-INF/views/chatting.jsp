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
<link rel="stylesheet" href="/resources/assets/css/chatting.css" />
<link rel="stylesheet" href="/resources/assets/css/loading.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body class="is-preload">
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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
				
				
				<table class="test">
					<tr class="rowMain">
					</tr>
				</table>
				<!-- </div> 추가 금지 -->
				<div class="container">
					<h3 class=" text-center who">메세지</h3>
					<div class="messaging">
						<div class="inbox_msg">
							<div class="inbox_people">
								<div class="headind_srch">
									<div class="recent_heading">
										<h4>대화목록</h4>
									</div>
									<div class="srch_bar">
										<div class="stylish-input-group">
											<!-- <input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">검색</button>
								</span> -->
										</div>
									</div>
								</div>
								<div class="inbox_chat">
									<c:forEach var="chatlist" items="${chatlist}">
										<div class="chat_list">
											<div class="chat_people">
												<div class="chat_img">
													<img src="https://ptetutorials.com/images/user-profile.png"
														alt="sunil">
												</div>
												<div class="chat_ib" onclick="ShowChat(`${chatlist.to_id}`)">
													<h5 class="whoChat">${chatlist.to_id}</h5>
													<div style="display: none" class="deleteDiv">
														<h5 class="delete"
															onclick="deleteChat(`${chatlist.to_id}`)">나가기</h5>
													</div>
												</div>
												<img src="/resources/assets/img/uparrow.png"
													onclick="toggle()" style="width: 25px; float: right;">
												<!-- 원래 코드 <div class="toggle" onclick="toggle()">토글형태</div> -->
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="mesgs">
								<div class="msg_history"></div>
								<div class="type_msg">
									<div class="input_msg_write">
										<input type="text" class="write_msg"
											placeholder="메세지를 입력하세요" />
										<ion-icon name="chatbox-ellipses-outline" size="large" class="msg_send_btn" onclick="ChatSend()"></ion-icon>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>	
					
					
			</div>		
		</div>
	</div>			
					
					
<script type="text/javascript">
	function deleteChat(to_id) {
		console.log(to_id)
		$.ajax({
			url : "deleteChat.do",
			type : "GET",
			data : {
				to_id : to_id,
			},
			success : function(cnt) {
				console.log(cnt)
				if (cnt > 0) {
					window.location.reload();
				}
			},
			error : function(e) {
				console.log(e)
			}
		})
	}
</script>
<script type="text/javascript">
	function toggle() {
		$('.deleteDiv').slideToggle()
	}
</script>
<script type="text/javascript">
	$('.whoChat').click(function() {
		var whochat = $(this).text()
		$.ajax({
			url : "whoChat.do",
			data : {
				whochat : whochat
			},
			success : function(who) {
				console.log(who)
				$('.who').html(who)
			},
			error : function(e) {
				console.log(e)
			}
		})

	})
</script>
<script type="text/javascript">
	function ShowChat(to_id) {
		$
				.ajax({
					url : "ShowChat.do",
					type : "GET",
					dataType : "json",
					data : {
						to_id : to_id
					},
					success : function(res) {
						$('.incoming_msg').remove()
						$('.outgoing_msg').remove()
						for (var i = 0; i < res.length; i++) {
							if (res[i].to_id == to_id) {
								$('.msg_history')
										.prepend(
												"<div class='incoming_msg'><div class='received_msg'><div class='received_withd_msg'><img class='imcoming_msg_img' src='https://ptetutorials.com/images/user-profile.png' alt='sunil'><p>"
														+ res[i].chat
														+ "</p><span class='time_date'>"
														+ res[i].date
														+ "</span></div></div></div>")

							} else {
								$('.incoming_msg')
										.last()
										.append(
												"<div class='outgoing_msg'><div class='sent_msg'><p>"
														+ res[i].chat
														+ "</p><span class='time_date'>"
														+ res[i].date
														+ "</span></div></div>")
							}
						}

					},
					error : function(e) {
						console.log(e)
					}
				})
	}
</script>

<script type="text/javascript">
	function ChatSend() {
		var chat = $('.write_msg').val()
		var to_id = `${user.id}`
		var from_id = $('.who').text()
		console.log('from_id', from_id)

		$
				.ajax({
					url : "ChatSend.do",
					type : "POST",
					data : {
						to_id : to_id,
						from_id : from_id,
						chat : chat
					},
					success : function(res) {
						if (res > 0) {
							console.log('성공하였습니다')
							$
									.ajax({
										url : "ResentChat.do",
										type : "GET",
										data : {
											from_id : from_id,
										},
										dataType : "json",
										success : function(
												resent) {
											console
													.log('1')
											$(
													'.incoming_msg')
													.last()
													.append(
															"<div class='outgoing_msg'><div class='sent_msg'><p>"
																	+ resent[0].chat
																	+ "</p><span class='time_date'>"
																	+ resent[0].date
																	+ "</span></div></div>")

										},
										error : function(e) {
											console.log(e)
										}

									})
						}
					},
					error : function(e) {
						console.log(e)
					}
				})
	}
</script>
</body>
</html>