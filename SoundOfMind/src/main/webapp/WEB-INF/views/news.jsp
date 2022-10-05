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
<link rel="stylesheet" href="/resources/assets/css/news.css" />
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
</body>
</html>