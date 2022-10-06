<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="text-align: center;">Hello World WebSocket</h1>
	<br>
	<div style="text-align: center;">
		<form action="">
			<input onclick="connect()" value="Connect" type="button"> <input
				onclick="send_message()" value="Send" type="button"> <input
				id="textID" name="message" value="Hello WebSocket!" type="text"><br>
		</form>
	</div>
	<div id="output"></div>
	<script type="text/javascript">
		var wsUri = "ws://localhost:8085/websocket";
		var websocket;
		var output;
		var textID
		function init() {
			output = document.getElementById("output");
			textID = document.getElementById("textID");
		}
		function connect() {
			if (!websocket) {
				websocket = new WebSocket(wsUri);
				websocket.onopen = function(evt) {
					onOpen(evt)
				};
				websocket.onmessage = function(evt) {
					onMessage(evt)
				};
				websocket.onerror = function(evt) {
					onError(evt)
				};
			}
		}

		function disconnect() {
			if (!websocket)
				websocket.close();
		}

		function send_message() {
			var message = textID.value;
			writeToScreen("나: " + message);
			websocket.send(message);
		}

		function onOpen(evt) {
			writeToScreen("Connected to Endpoint!");
		}

		function onMessage(evt) {
			writeToScreen("상대방: " + evt.data);
		}

		function onError(evt) {
			writeToScreen('ERROR: ' + evt.data);
		}

		function writeToScreen(message) {
			var pre = document.createElement("p");
			pre.style.wordWrap = "break-word";
			pre.innerHTML = message;
			output.appendChild(pre);
		}
		window.addEventListener("load", init, false);
	</script>


</body>
</html>