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

<html lang="en">
<head>
<title>마음의 소리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/community.css" />
<!-- animated -->
<link rel="stylesheet" href="/resources/assets/css/community2.css" />

<!-- js연결 -->
<script src="/resources/assets/js/community.js"></script>

<style type="text/css">
#header {
	display: -moz-flex;
	display: -webkit-flex;
	display: -ms-flex;
	display: flex;
	border-bottom: solid 5px #6495ED;
	padding: 6em 0 1em 0;
	position: relative;
}

.bg-dark {
	background-color: #6495ED !important;
}

.nav-link {
	display: initial;
	padding: 0.5rem 1rem;
	border-bottom: black;
	color: black !important;
}

.pagination {
	display: block;
	text-align: center;
}
</style>

<!-- animated -->
<style type="text/css">
#lia {
	position: relative;
	padding: 0.6em 2em;
	font-size: 18px;
	border: none;
	outline: none;
	color: #333;
	display: inline-block;
	text-decoration: none;
	z-index: 3;
}

#search {
	width: 35vh;
	position: absolute;
	right: 6%;
}
</style>

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main" style="background-color: white;">
			<div class="inner" style="background-color: white;">
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
				<!-- 상단 메뉴  & 검색 -->
				<!-- 검색 -->
				<div id="search" class="alt">
					<input type="text" name="query" id="query" placeholder="검색"
						style="margin-top: 15px;"> <span
						onclick="CoummunitySearch()"> <ion-icon
							name="search-circle-outline"></ion-icon>
					</span>
				</div>

				<c:choose>
					<c:when test="${user==null && Kakao == null && Naver == null}">
						<a href="login.do"><img src="/resources/assets/img/write2.png"
							style="width: 40px; display: block; margin-top: 13px; margin-left: 0%;"></a>
					</c:when>
					<c:otherwise>
						<img src="/resources/assets/img/write2.png" onclick="boardWrite()"
							style="width: 40px; display: block; margin-top: 13px; margin-left: 0%;">
					</c:otherwise>
				</c:choose>


				<!-- Table -->

				<div class="table-wrapper"
					style="margin-right: 20px; margin-top: 35px;">
					<div class="panel">
						<div class="body">
							<div class="input-group">

								<input type="hidden" id="searchBox" placeholder="Filtrar...">
							</div>
						</div>
					</div>
					<table class="myTable table hover">

						<thead class="tohead">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody class="tobody">
							<c:forEach var="comushow" items="${comushow}" varStatus="status">
								<tr>
									<td style="text-align: center;">${comushow.rownum}</td>
									<td onclick="board(`${comushow.s_index}`,`${comushow.click}`)">${comushow.title}</td>
									<td style="text-align: center;" class="${status.index}"
										onclick="userid(`${status.index}`)">${comushow.id}</td>
									<td style="text-align: center;">${comushow.date}</td>
									<td style="text-align: center;">${comushow.click}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>



				<!-- 조회수 높은 10개의 게시글 출력 -->
				<div class="box"
					style="margin-top: 35px; width: 25%; float: right; margin-right: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; margin-bottom: 10px;">
					<h5>인기 게시글</h5>
					<c:forEach var="clickBest" items="${clickBest}" begin="0" end="9">
						<span onclick="board(`${clickBest.s_index}`,`${clickBest.click}`)">${clickBest.rownum}.
							${clickBest.title}</span>
						<br />
					</c:forEach>
				</div>


				<div class="box"
					style="margin-top: 10px; width: 25%; float: right; margin-right: 10px;">
					<h5>간편 메세지</h5>
					<h6>받는 이</h6>
					<p>
						<input type="text" name="messegeId" id="messegeId">
					</p>
					<div class="row uniform">
						<h6 style="padding-left: 22px;">메세지</h6>
						<div class="box" style="width: 980px; margin-left: 22px;">
							<textarea name="demo-name" id="demo-name" placeholder="내용을 입력하세요"
								style="width: 100%; height: 202px; margin-bottom: 20px; resize: none;"></textarea>
							<!-- 업로드버튼 -->
							<ul class="actions small">
								<li><button class="button small"
										onclick="ToMessage(`${user.id}`)">보내기</button></li>
							</ul>
						</div>
					</div>

				</div>



				<!-- 페이지 넘김 -->
				<!-- <ul class="pagination">
					<li><span class="button disabled">Prev</span></li>
					<li><a href="#" class="page active">1</a></li>
					<li><a href="#" class="page">2</a></li>
					<li><a href="#" class="page">3</a></li>
					<li><span>&hellip;</span></li>
					<li><a href="#" class="page">8</a></li>
					<li><a href="#" class="page">9</a></li>
					<li><a href="#" class="page">10</a></li>
					<li><a href="#" class="button">Next</a></li>
				</ul>
 -->


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
		function board(s_index, click) {
			location.href = "board.do?s_index=" + s_index + "&click=" + click
		}
	</script>
	<script type="text/javascript">
		function userid(index) {
			var userid = $('.' + index).html()
			$('input[name=messegeId]').attr('value', userid)
		}
	</script>
	<script type="text/javascript">
		function ToMessage(to_id) {
			var from_id = $('#messegeId').val()
			var chat = $('#demo-name').val()
			if(to_id == '') {
				swal({
					button: "로그인",
					title:'로그인이 필요합니다.',
					icon:'warning'
				}).then(result=>{
				location.href = "http://localhost:8085/login.do"
				})
			} else {
				if(chat==''){
					alert('내용을 입력하세요')
				}else{
				$.ajax({
					url : 'ToMessage.do',
					data : {
						to_id : to_id,
						from_id : from_id,
						chat : chat
					},
					type : "GET",
					success : function(res) {
						if(res==''){
							alert('없는 아이디입니다')
						}else{
						swal({
							  icon: 'success',                  
							  title: '전송 완료',    
							  text: '메세지가 전송되었습니다.', 
							}).then(result=>{
						$('#demo-name').val('')
						$('#messegeId').val('')
						location.reload()
							})
						}
					},
					error : function() {
						console.log('fail')
					}
				})
				}
			}
		}
	</script>
	<script type="text/javascript">
		function boardWrite() {
			location.href = "http://localhost:8085/boardWrite.do"
		}
		function CoummunitySearch() {
			var search = $('#query').val()
			console.log(search)
			$.ajax({
				url : "search.do",
				data : {
					search : search
				},
				type : "GET",
				dataType : "json",
				success : function(res) {
					console.log(res)
					$('.tobody').html('')
					for (var i = 0; i < res.length; i++) {
						$('.tobody').append('<tr></tr>')
						$('.tobody tr').last().append(
								'<td>' + res[i].rownum + '</td>'
										+ "<td onclick=board(" + res[i].s_index
										+ ',' + res[i].click + ")>"
										+ res[i].title + "</td>"
										+ "<td class=userid>" + res[i].id
										+ "</td>" + "<td>" + res[i].date
										+ "</td>" + "<td>" + res[i].click
										+ "</td>")
					}
					$('#query').val('')
				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>



	<!-- icon -->
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>

	<!-- 페이지네이션 -->
	<script type="text/javascript">
		let options = {
			numberPerPage : 10, //Cantidad de datos por pagina
			goBar : true, //Barra donde puedes digitar el numero de la pagina al que quiere ir
			pageCounter : true, //Contador de paginas, en cual estas, de cuantas paginas
		};

		let filterOptions = {
			el : '#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
		};

		paginate.init('.myTable', options, filterOptions);
	</script>

	<!-- 
	<script type="text/javascript">
	if (window.performance.navigation.type == 2) {
		location.reload();
	}
	if (window.performance.getEntriesByType("navigation")[0].type == "back_forward") {
		location.reload();
	} 
	</script>
	 -->

</body>
</html>