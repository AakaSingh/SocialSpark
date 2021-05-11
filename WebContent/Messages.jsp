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

.chatbox::-webkit-scrollbar
{
	display: none;
}

.txtblob{
	background-color: lightblue;
	width: 200px;
	color: black;
	font-family: arial;
	margin: 5px 0px 5px 0px;
	border-radius: 10px;
	padding: 2px;
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}

table{
	width:100%;
	height:100%;
}

#lft
{
	height: 100%;
	width: 20%;
	float: left;
}
#rgt
{
	height: 100%;
	width: 70%;
	float: right;
}

</style>
</head>
<body>

<div id="lft">
	<table>
		<c:forEach var="temp" items="${userFriends}">
			<tr><td><a href="./LoadMessages?chat=${temp}">${temp}</a></td></tr>
		</c:forEach>
	</table>
</div>


<div id="rgt">
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
</div>
</body>
</html>