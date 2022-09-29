<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/assets/css/chatting.css" />
<!------ Include the above in your HEAD tag ---------->

</head>
<body>
	<h1>hi, chatting page</h1>
	<table>
		<thead>대화목록
		</thead>
		<c:forEach var="chatlist" items="${chatlist}">
			<tr>
				<td onclick="ShowChat(`${chatlist.to_id}`)">${chatlist.to_id}</td>
			</tr>
		</c:forEach>
	</table>

	<table class="test">
		<tr class="rowMain">

		</tr>

	</table>
	<div class="container">
		<h3 class=" text-center">Messaging</h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>Recent</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">검색</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mesgs">
					<div class="msg_history">
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>Test which is a new approach to have all solutions</p>
									<span class="time_date"> 11:01 AM | June 9</span>
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>Test which is a new approach to have all solutions</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>Test, which is a new approach to have</p>
									<span class="time_date"> 11:01 AM | Yesterday</span>
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>Apollo University, Delhi, India Test</p>
								<span class="time_date"> 11:01 AM | Today</span>
							</div>
						</div>
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>We work directly with our designers and suppliers, and
										sell direct to you, which means quality, exclusive products,
										at a price anyone can afford.</p>
									<span class="time_date"> 11:01 AM | Today</span>
								</div>
							</div>
						</div>
					</div>
					<div class="type_msg">
						<div class="input_msg_write">
							<input type="text" class="write_msg" placeholder="Type a message" />
							<button class="msg_send_btn" type="button">보내기</button>
						</div>
					</div>
				</div>
			</div>


			<p class="text-center top_spac">
				Design by <a target="_blank"
					href="https://www.linkedin.com/in/sunil-rajput-nattho-singh/">Sunil
					Rajput</a>
			</p>

		</div>
	</div>
	<script type="text/javascript">
		function ShowChat(to_id) {
			$.ajax({
				url : "ShowChat.do",
				type : "GET",
				dataType : "json",
				data : {
					to_id : to_id
				},
				success : function(res) {
					console.log(res)
					$('.to_id').remove()
					$('.row').remove()
					$('.rowMain').last().append(
							"<th scope='row' class='to_id'>" + to_id + "</th>")
					for (var i = 0; i < res.length; i++) {
						$('.to_id').last().append(
								"<tr class='row'><td>" + res[i].to_id
										+ "</td><td>" + res[i].chat
										+ "</td><td>" + res[i].date
										+ "</td></tr>")
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