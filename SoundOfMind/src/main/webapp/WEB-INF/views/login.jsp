<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Form Design</title>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
        <link rel="stylesheet" href="/resources/assets/css/login_css.css"/>
    </head>
    
    <body>
	
       <form action="login.do" method="post" class="login-form">
            <h1>로그인</h1>
            <div class="textb">
                <input type="text" name="id" required>
                <div class="placeholder">아이디</div>
            </div>

            <div class="textb">
                <input type="password" name="pw" required>
                <div class="placeholder">패스워드</div>
                <div class="show-password fas fa-eye-slash"></div>
            </div>

          
            <button type="submit" class="btn fas fa-arrow-right" disabled></button>
            <a href="join.do">회원가입</a>
        </form>

        <script src="/resources/assets/js/login.js"></script>
    </body>
</html>