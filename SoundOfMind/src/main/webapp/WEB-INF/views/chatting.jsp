<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

</head>
<body>
	<h1>hi, chatting page</h1>
	<table>
		<thead>대화목록
		</thead>
		<c:forEach var="chatlist" items="${chatlist}">
			<tr>
				<td onclick="ShowChat(`${chatlist.to_id}`)">${chatlist.to_id}</td>
			</tr>
		</c:forEach>
	</table>

	<table class="test">
		<tr class="rowMain">

		</tr>

	</table>
	<script type="text/javascript">
		function ShowChat(to_id) {
			$.ajax({
				url : "ShowChat.do",
				type : "GET",
				dataType : "json",
				data : {
					to_id : to_id
				},
				success : function(res) {
					console.log(res)
					$('.to_id').remove()
					$('.row').remove()
					$('.rowMain').last().append(
							"<th scope='row' class='to_id'>" + to_id + "</th>")
					for (var i = 0; i < res.length; i++) {
						$('.to_id').last().append(
								"<tr class='row'><td>"+res[i].to_id+"</td><td>" + res[i].chat
										+ "</td><td>" + res[i].date
										+ "</td></tr>")
					}

				},
				error : function(e) {
					console.log(e)
				}
			})
		}
	</script>
</body>
</html>