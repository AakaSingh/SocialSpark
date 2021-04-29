<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat</title>
<style>
.msgbox{
	height: 500px;
	width: 300px;
	margin: auto;
	background-color: lightgrey;
	border: 1px solid;
}

.chatbox{
	height: 400px;
	width: 290px;
    overflow-x: hidden;
    overflow-y: auto;
    background-color: lightgreen;
    border: 1px solid;
}

.txtblob{
	background-color: lightblue;
	width: 200px;
	color: black;
	font-family: arial;
	margin: 5px 0px 5px 0px;
	border-radius: 10px;
	padding: 2px;
}

table{
	width:100%;
	height:100%;
}

</style>
</head>
<body>
<div class="msgbox">
<table>
<tr><th colspan="2">${chatUser.getUserName()} <th></tr>
<tr><td colspan="2">
<div class="chatbox">
<c:forEach var="msg" items="${messages}">
<c:choose>
<c:when test="${msg.getSenderId().equals(currentUser.getUserId())}">
	<div class="txtblob" style="float:right">
		<span style="font-size: 50%">${msg.getTime()}</span><br>
		${msg.getMsgContent()}<br>
	</div>
</c:when>
<c:otherwise>
	<div class="txtblob" style="float:left">
		<span style="font-size: 50%">${msg.getTime()}</span> <br>
		${msg.getMsgContent()}<br>
	</div>
</c:otherwise>
</c:choose>

</c:forEach>
</div>
</td></tr>
<tr><form action="./NewMessage"><td><input type="text" name="txt"></td><td><button type="submit">Send</button></td></form></tr>

</table>
</div>
</body>
</html>