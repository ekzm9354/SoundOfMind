<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sound of Mind</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<link rel="stylesheet" href="/resources/assets/css/tailwind.output.css" />

<style type="text/css">
#header {
    display: -moz-flex;
    display: -webkit-flex;
    display: -ms-flex;
    display: flex;
    border-bottom: solid 35px #6495ED;
    padding: 6em 0 3em 0;
    padding-top: 2.5em;
    position: relative;
}
#header .logo {
    font-size: 2.125em;
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
				<header id="header" style="margin-right: 100px;">
					<a href="index.html" class="logo"><strong>Sound</strong> of
						Mind </a>
					<ul class="icons">
						<c:if test="${user==null}">
							<li><a href="login.do"><span class="label">Login</span></a></li>
							<li><a href="join.do"><span class="label">Sign Up</span></a></li>
						</c:if>
						<c:if test="${user!=null }"> 
						${user.name}님 
						<li><a href="logout.do"><span class="label">Logout</span></a></li>
						</c:if>
					</ul>

				</header>

			</div>
		
				
				
				    <!-- New Table -->
					<div class="w-full overflow-hidden rounded-lg shadow-xs" style="width: 900px; margin-left: 80px; margin-top: 30px;">
						<div class="w-full overflow-x-auto">
							<table class="w-full whitespace-no-wrap">
								<thead>
									<tr
										class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
										<th class="px-4 py-3">TITLE/WRITER</th>
									</tr>
								</thead>
								<tbody
									class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="px-4 py-3">
											<div class="flex items-center text-sm">
												<!-- Avatar with inset shadow -->
												<div>
													<div
														class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
														<img class="object-cover w-full h-full rounded-full"
															src="https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
															alt="" loading="lazy" />
														<div class="absolute inset-0 rounded-full shadow-inner"
															aria-hidden="true"></div>
													</div>
													<p class="font-semibold">청각장애인의 도서관 이용 활성화를 위한 교육 및
														문화프로그램 모델 개발</p>
													<p class="text-xs text-gray-600 dark:text-gray-400">SUZY
													</p>
												</div>
											</div>
										</td>
									</tr>
		
		
								</tbody>
							</table>
						</div>
						
				
				<div
					class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
					<span class="flex items-center col-span-3"> Showing 21-30 of
						100 </span> <span class="col-span-2"></span>
					<!-- Pagination -->
					<span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
						<nav aria-label="Table navigation">
							<ul class="inline-flex items-center">
								<li>
									<button
										class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
										aria-label="Previous">
										<svg aria-hidden="true" class="w-4 h-4 fill-current"
											viewBox="0 0 20 20">
					                      <path
												d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
												clip-rule="evenodd" fill-rule="evenodd"></path>
					                    </svg>
									</button>
								</li>
								<li>
									<button
										class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
										1</button>
								</li>
								<li>
									<button
										class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
										2</button>
								</li>
								<li>
									<button
										class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple">
										3</button>
								</li>
								<li>
									<button
										class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
										4</button>
								</li>
								<li><span class="px-3 py-1">...</span></li>
								<li>
									<button
										class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
										8</button>
								</li>
								<li>
									<button
										class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
										9</button>
								</li>
								<li>
									<button
										class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
										aria-label="Next">
										<svg class="w-4 h-4 fill-current" aria-hidden="true"
											viewBox="0 0 20 20">
					                      <path
												d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
												clip-rule="evenodd" fill-rule="evenodd"></path>
					                    </svg>
									</button>
								</li>
							</ul>
						</nav>
					</span>
				</div>




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
								<li><a href="#">INFORMATION</a></li>
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
</body>
</html>