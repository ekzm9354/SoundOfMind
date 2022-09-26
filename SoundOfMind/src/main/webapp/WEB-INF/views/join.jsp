<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}
</style>
<title>Insert title here</title>
</head>
<body>
<h1> 회원가입 </h1>
<form action="join.do" method="post">

	NAME : <input type="text" name="name"> <br>
	ID : <input type="text" name="id"> <br>
	PW : <input type="password" name="pw"> <br>
	GRADE : <input type="text" name="grade"> <br>
	<!-- 동의 할거니?  -->
	<button type="submit">회원가입하기</button>
</form>
</body>
</html>