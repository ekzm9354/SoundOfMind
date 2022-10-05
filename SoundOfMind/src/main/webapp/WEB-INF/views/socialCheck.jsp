<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sound Of Mind</title>
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
</head>
<body>
	<h5>로그인을 계속 진행하시려면 확인 버튼을 눌러주세요</h5>
	<button class="searchUser_btn"
		onclick="searchUser(`${AccessToken}`,`${Socail}`)">확인</button>
	<script type="text/javascript">
function searchUser(AccessToken,Socail){
	console.log('AccessToken:'+AccessToken)
	console.log('Socail:'+`${Socail}`)
	Kakao.Auth.setAccessToken(AccessToken);
	Kakao.API.request({
		  url: '/v2/user/me',
		})
		  .then(function(response) {
		    console.log(response);
		    var id = response.id
		    location.href = "http://localhost:8085/kakao.do?id="+id+"&Socail="+Socail
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
	    var email = naver_id_login.getProfileData('email')
	    var Socail = 'naver'
	    console.log(Social)
	    console.log(email)
	    location.href="http://localhost:8085/NaverLogin?email="+email+"&Social="+Social
	  }
</script>
</body>
</html>