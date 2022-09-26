<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${user==null}">
		<jsp:forward page="login.jsp"></jsp:forward></c:if>
	<c:if test="${user!=null}">
		<h1>hi, this is storege</h1>
		<table border="1">
			<tr>
				<td>번호</td>
				<td>내용</td>
				<td>감정</td>
			</tr>
		<c:forEach var="storege" items="${storege}">	
			<tr>
				<td></td>
				<td>${storege.text}</td>
				<td>${storege.emotion}</td>
			</tr>
			</c:forEach>

		</table>
	</c:if>
</body>
</html>