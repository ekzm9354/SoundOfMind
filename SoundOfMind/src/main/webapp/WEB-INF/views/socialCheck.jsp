<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마음의 소리</title>
<!-- kakao -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.0/kakao.min.js"
	integrity="sha384-PFHeU/4gvSH8kpvhrigAPfZGBDPs372JceJq3jAXce11bVA6rMvGWzvP4fMQuBGL"
	crossorigin="anonymous"></script>
<script>
  Kakao.init('0e90ffc2b83bed9cbdd0b545402d1987'); // Enter your app's JavaScript key
</script>
<!-- naver -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- main -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- 버튼 -->
<link rel="stylesheet" href="/resources/assets/css/social.css" />

<!-- animate -->
<script src="/resources/assets/js/social.js"></script>

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
				</header>


			</div>
			<!-- 버튼 -->
			<c:if test="${Social=='kakao'}">
				<div class="container">
					<div id="cursor">
						<div class="cursor__inner"></div>
					</div>
					<a href="#" class="button" cursor-class="overlay"
						style="background-color: #CCE5FF; margin-top: 110px; font-family: 'NanumSquare' !important; font-size: 1em;">
						<span class="button-text" id="hov">계속 진행하시겠습니까?</span> <span
						class="button-text foreground-text"
						onclick="searchUser(`${AccessToken}`,`${Social}`)">네</span>
					</a>
				</div>
			</c:if>
			<c:if test="${Social=='naver'}">
				<div class="container">
					<div id="cursor">
						<div class="cursor__inner"></div>
					</div>
					<a href="#" class="button" cursor-class="overlay"
						style="background-color: #CCE5FF; margin-top: 110px; font-family: 'NanumSquare' !important; font-size: 1em;">
						<span class="button-text">계속 진행하시겠습니까?</span> <span
						class="button-text foreground-text">네</span>
					</a>

				</div>
			</c:if>

			<!-- 버튼 끝 -->

		</div>

	</div>




	<script type="text/javascript">
function searchUser(AccessToken,Social){
	console.log('AccessToken:'+AccessToken)
	console.log('Social:'+`${Social}`)
	Kakao.Auth.setAccessToken(AccessToken);
	Kakao.API.request({
		  url: '/v2/user/me',
		})
		  .then(function(response) {
		    console.log(response);
		    var id = response.id
		    location.href = "http://localhost:8085/kakao.do?id="+id+"&Social="+Social
		  })
		  .catch(function(error) {
		    console.log(error);
		  });
}
</script>
	<script type="text/javascript">
	var naver_id_login = new window.naver_id_login(
			"hWpTeIKVxZ06AslRia4v", "http://localhost:8085/NaverLogin")
	console.log(naver_id_login.oauthParams.access_token);
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() {
		 var id = naver_id_login.getProfileData('email');
		 console.log('email변수: '+id)
		 location.href="http://localhost:8085/NaverLogin.do?id="+id+"&Social=naver"
	}
	
</script>

	<!-- 버튼 js -->
	<script type="text/javascript">
const cursor = document.querySelector("#cursor")

let mouse = { x: -100, y: -100 }
let pos = { x: 0, y: 0 }
const speed = 0.1

const updateCoordinates = (e) => {
  mouse.x = e.clientX
  mouse.y = e.clientY
}

window.addEventListener("mousemove", updateCoordinates)

const updatePosition = () => {
  pos.x += (mouse.x - pos.x) * speed
  pos.y += (mouse.y - pos.y) * speed
  cursor.style.transform =
    "translate3d(" + pos.x + "px ," + pos.y + "px, 0)"
}

const loop = () => {
  updatePosition()
  requestAnimationFrame(loop)
}

requestAnimationFrame(loop)

const cursorModifiers = document.querySelectorAll("[cursor-class]")

cursorModifiers.forEach((cursorModifier) => {
  cursorModifier.addEventListener("mouseenter", function () {
    let attribute = this.getAttribute("cursor-class")
    cursor.classList.add(attribute)
  })
  
  cursorModifier.addEventListener("mouseleave", function () {
    let attribute = this.getAttribute("cursor-class")
    cursor.classList.remove(attribute)
  })
})
</script>




</body>
</html>