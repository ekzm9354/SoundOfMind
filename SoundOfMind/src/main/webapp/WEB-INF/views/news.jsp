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
						${user.id}님 
						<li><a href="logout.do"><span class="label">로그아웃</span></a></li>
						</c:if>
					</ul>
				</header>


				<section id="banner">
					<div class="content">
						<header>
							<h1>뉴스</h1>

						</header>
	<!-- 여기부터 뉴스 나오는 칸 꾸미기는 나중에 하겠슴당~ 일단 틀만,,  -->
 <h2>긍정뉴스</h2>
  <table>
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">날짜</th>
        <th scope="col">제목</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>2022.10.06</td>
        <td>긍정 뉴스 제목임당</td>
      </tr>
      <tr>
        <td>2</td>
        <td>2022.10.06</td>
        <td>긍정 뉴스 제목임당2</td>
      </tr>
    </tbody>
  </table>
  
   <h2>부정뉴스</h2>
  <table>
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">날짜</th>
        <th scope="col">제목</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>2022.10.06</td>
        <td>부정 뉴스 제목임당</td>
      </tr>
      <tr>
        <td>2</td>
        <td>2022.10.06</td>
        <td>부정 뉴스 제목임당2</td>
       </tr>
    </tbody>
  </table>

 <h2>중립 뉴스</h2>
  <table>
    <thead>
      <tr>
        <th scope="col">번호</th>
        <th scope="col">날짜</th>
        <th scope="col">제목</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>1</td>
        <td>2022.10.06</td>
        <td>중립 뉴스 제목임당</td>
      </tr>
    </tbody>
  </table>


	<!-- 여기부터 뉴스 나오는 칸  -->
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
						<h2>메뉴</h2>
					</header>
					<ul>
						<li><span class="opener">커뮤니티</span>
							<ul>
								<li><a href="community.do">게시판</a></li>
								<li><a href="news.do">뉴스</a></li>
								<li><a href="chatting.do">채팅</a></li>
							</ul></li>
						<li><a href="mypage.do">프로필</a></li>
						<li><a href="elements.html">의견 보내기</a></li>
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
   
</body>
</html>