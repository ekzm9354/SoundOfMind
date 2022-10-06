<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>

<html lang="en">
<head>
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/news.css" />
<link rel="stylesheet" href="/resources/assets/css/community2.css" />

<!-- bootsnipp -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

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
      outline:none;
      color: #333;
      display: inline-block;
      text-decoration: none;
      z-index: 3;
}
</style>


</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main"  style="background-color: white;">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of Mind
					</a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">로그인</span></a></li>
							<li><a href="join.do"><span class="label">회원가입</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>
				</header>
				
				
					<!-- 상단 메뉴  & 검색 -->
				<nav class="navbar navbar-expand navbar-light bg-white"
					style="height: 81px;">
					<div class="container">
						<div class="collapse navbar-collapse">
							<ul class="navbar-nav">
								<li class="nav-item active"><a href="community.do" class="nav-link">
										<img src="/resources/assets/img/board.png" width="27px"
										height="27px">
										자유게시판
								</a></li>
								<li class="nav-item"><a href="news.do" class="nav-link"> <img
										src="/resources/assets/img/news3.png" width="27px"
										height="27px">
										뉴스
								</a></li>
								<li class="nav-item"><a href="chatting.do" class="nav-link"> <img
										src="/resources/assets/img/chat3.png" width="27px"
										height="27px">
										채팅
								</a></li>
							</ul>
							<!-- 검색 -->
							<section id="search" class="alt"
								style="width: 50%; margin-left: 20px; margin-right: 20px;">
								<form action="#">
									<input type="text" name="query" id="query" placeholder="검색"
										style="margin-top: 30px;" />
								</form>
							</section>
							<ul class="navbar-nav d-none d-md-block">
								<li class="nav-item"><a class="nav-link"> <img
										src="/resources/assets/img/write2.png" width="32px"
										height="32px" onclick="boardWrite()">
										글쓰기
								</a></li>
							</ul>
						</div>
					</div>
				</nav>
				


				<section id="banner">
					<div class="content">
						<header>
							<h1>NEWS</h1>

						</header>
	
						<div class="box">
							<div class="content">
								<!--꾸미기는 나중에 할거임!!!!   -->
								<span>date : 2022.10.05  </span><br>
								<span>여기는 기사 제목입니당당당 </span>
								<div class="contentStr">
									여기는 본문 내용입니다 내용내용내용내용내욘이ㅏㅁ니아ㅓ리마ㅓㄴㅇ리ㅏㅓ
									ㅁㄴ이ㅏ러미ㅏㄴ어림ㄴ미낭러미ㅏ넝리마넝리ㅏㅓㅁ닝럼넝리먼ㅇㄹㅁㄴ아러밍너리ㅏㅁ넝리ㅓㅁ니아러머낭ㄹ
									ㅁㄴ아ㅣ러만어리먼ㅇ리ㅏㅓㅁ닝럼넝리ㅏㅁ너이러ㅣㅏㅁㄴㅇ
									ㄹ미ㅏ넝리ㅏㅓㅁ재댜러ㅣㅏㅁ넝리마넝리ㅏㅓㄴ이러ㅣ나ㅓㅁ리ㅓ닐
									ㅁ나어리마넝리ㅓ민ㅇ러ㅣㅁㅇ너림넝리ㅏㅓㅁ니아러 쏘랴랴랴랴랴랴
									
								</div>
							</div>
						</div>


						<div class="box">
							<div class="content">
								<span>date : 2022.10.05 </span>
								<div class="contentStr"></div>
							</div>
						</div>


					</div>

				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
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
					</ul>
				</nav>

			</div>
		</div>
</div>
		<!-- Scripts -->
		<script src="/resources/assets/js/jquery.min.js"></script>
		<script src="/resources/assets/js/browser.min.js"></script>
		<script src="/resources/assets/js/breakpoints.min.js"></script>
		<script src="/resources/assets/js/util.js"></script>
		<script src="/resources/assets/js/news.js"></script>
		<script text="javascript/text">
    $(document).ready(function(){
 
        $('.box').each(function(){
            //var content = $(this).children('.content');
            var content = $(this).find('.contentStr');
 
            var content_txt = content.text();
            var content_html = content.html();
            var content_txt_short = content_txt.substring(0,100)+"...";
            var btn_more = $('<a href="javascript:void(0)" class="more">더보기</a>');
 
            
            $(this).append(btn_more);
            
            if(content_txt.length >= 100){
                content.html(content_txt_short)
                
            }else{
                btn_more.hide()
            }
            
            btn_more.click(toggle_content);
            function toggle_content(){
                if($(this).hasClass('short')){
                    // 접기 상태
                    $(this).html('더보기');
                    content.html(content_txt_short)
                    $(this).removeClass('short');
                }else{
                    // 더보기 상태
                    $(this).html('접기');
                    content.html(content_html);
                    $(this).addClass('short');
 
                }
            }
        });
    });
  </script>
  
  <!-- bootsnipp -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 $(document).ready(function() {
         $("li.nav-item").click(function (e) {
             e.preventDefault();
             $(".nav-item").removeClass("active");
             $(this).addClass("active");   
         });
     });
	</script>
  
  
</body>
</html>