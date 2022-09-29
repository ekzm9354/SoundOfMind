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
<title>Sound of Mind</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css">

<style type="text/css">
#header {
    display: -moz-flex;
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    border-bottom: #6495ED;
    padding: 6em 0 1em 0;
    position: relative;
}
.bg-dark {
    background-color: #6495ED!important;
}
.nav-link {
    display: initial;
    padding: 0.5rem 1rem;
    border-bottom: black;
}
</style>

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.do" class="logo"><strong>Sound</strong> of
						Mind </a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">Login</span></a></li>
							<li><a href="join.do"><span class="label">Sign Up</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">Logout</span></a></li>
							<%-- <li><a href="delete.do?id=${user.id}" ><span class="label">회원탈퇴</span></a></li> --%>
						</c:if>
					</ul>

				</header>
				
				
											<!-- 상단 메뉴  & 검색 -->
												<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 46px;">
								
													<div class="navbar-collapse collapse" id="navbarsExample05"	style="">
														<ul class="navbar-nav mr-auto">
															<li class="nav-item active"><a class="nav-link" href="#" style="height: 32px;">BOARD<span class="sr-only">(current)	</span>	</a></li>
															<li class="nav-item active"><a class="nav-link" href="#" style="height: 32px;">NEWS<span class="sr-only">(current) </span>	</a></li>
															<li class="nav-item active"><a class="nav-link" href="#" style="height: 32px;">CHATTING<span class="sr-only">(current) </span>	</a></li>
														</ul>
														<form class="form-inline my-2 my-md-0">
															<input class="form-control" type="text" placeholder="Search" style="height: 32px;">
														</form>
													</div>
												</nav>


											<!-- Table -->
													<h3>Table</h3>

													<h4>Default</h4>
													<div class="table-wrapper">
														<table>
															<thead>
																<tr>
																	<th>Name</th>
																	<th>Description</th>
																	<th>Price</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>Item1</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>29.99</td>
																</tr>
																<tr>
																	<td>Item2</td>
																	<td>Vis ac commodo adipiscing arcu aliquet.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item3</td>
																	<td> Morbi faucibus arcu accumsan lorem.</td>
																	<td>29.99</td>
																</tr>
																<tr>
																	<td>Item4</td>
																	<td>Vitae integer tempus condimentum.</td>
																	<td>19.99</td>
																</tr>
																<tr>
																	<td>Item5</td>
																	<td>Ante turpis integer aliquet porttitor.</td>
																	<td>29.99</td>
																</tr>
															</tbody>
															<tfoot>
																<tr>
																	<td colspan="2"></td>
																	<td>100.00</td>
																</tr>
															</tfoot>
														</table>
													</div>
													
													
													<!-- Preformatted Code -->
													<h3>BOARD TOP 10</h3>
													<pre><code>
														1.
														2.
														3.
														4.
													</code></pre>
													
													
													
												<!-- 페이지 넘김 -->
												<ul class="pagination">
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
													

			</div>
		</div>
		<!-- Sidebar. -->
		<div id="sidebar">
			<div class="inner">
				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>MENU</h2>
					</header>
					<ul>
						<li><span class="opener">COMMUNITY</span>
							<ul>
								<li><a href="community.do">BOARD</a></li>
								<li><a href="#">NEWS</a></li>
								<li><a href="#">CAHTTING</a></li>
							</ul></li>
						<li><a href="mypage.do">MY PAGE</a></li>
						<li><a href="#">SETTING</a></li>
						<li><a href="elements.html">SEND FEEDBACK</a></li>
					</ul>
				</nav>

				<!-- Footer. -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/browser.min.js"></script>
	<script src="/resources/assets/js/breakpoints.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>
	<script type="text/javascript">
		function speaker() {
			$.ajax({
				url : "http://127.0.0.1:5000/stt",
				data : {
					num : 1
				},
				success : function(text) {
					console.log(text)
					$('input[name=inputSTT]').attr('value', text)
				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>
	
	<!-- bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"></script>

</body>
</html>