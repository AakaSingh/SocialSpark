<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat</title>
<style>
	body
	{
		background-image: url('./images/back.png');
		background-position: center;
  		background-repeat: no-repeat;
  		background-size: cover;
	}
input
{
	width: 90%;
	border: 1px solid #556882;
	height: 90%;
	margin: 5px 0px;
	border-radius : 5px;
	color: white;
	background-color: black;
}
a
{
	text-decoration: none;
	font-family: arial;
	font-size: 200%;
	color: white;
}
a:hover
{
	color: grey;
}

.msgbox{
	height: 500px;
	width: 80%;
	margin: auto;
	background-color: #556882;
	float: right;
}

.chatbox{
	height: 400px;
	width: 100%;
    overflow-x: hidden;
    overflow-y: auto;
    background-color:	white;
    margin: auto;
    border-radius: 5px;
}

.chatbox::-webkit-scrollbar
{
	display: none;
}

.txtblob{
	background-color: lightblue;
	width: 50%;
	height: 15%;
	color: white;
	text-shadow: 2px 1px rgba(0,0,0,0.2);;
	font-family: arial;
	margin: 15px 10px 15px 10px;
	padding: 10px 50px;
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	font-size: 150%;
	
}

table{
	width:80%;
	height:100%;
	border-collapse: collapse;
	border: none;
	margin: auto;
	text-align: left;
}

#lft
{
	height: 500px;
	width: 20%;
	float: left;
	background-color: lightblue;
	text-align: center;
}
#rgt
{
	height: 100%;
	width: 80%;
	float: right;
}

button
{
	height: 90%;
	width: 100%;
	font-family: arial;
	color: white;
	background-color: black;
	border: none;
	border-radius: 5px;
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	
}
button:hover
{
	background-color: grey;
	color: black;
}

th
{
	font-size: 200%;
	color: white;
	font-family: arial;
}

</style>
</head>
<body>

<a href="./LoadProfile?profileUser=${currentUser.getUserName()}"><button>Back To Profile</button></a>

<div id="lft">
	<table>
		<c:forEach var="temp" items="${userFriends}">
			<tr><td><a href="./LoadMessages?chat=${temp}">${temp}</a></td></tr>
		</c:forEach>
	</table>
</div>


<div class="msgbox">
	<table>
	<tr><th colspan="2">${chatUser.getUserName()} <th></tr>
	<tr><td colspan="2">
	<div class="chatbox">
		<c:forEach var="msg" items="${messages}">
			<c:choose>
				<c:when test="${msg.getSenderId().equals(currentUser.getUserId())}">
					<div class="txtblob" style="float:right; border-radius: 10px 50px 0px 10px;">
						<span style="font-size: 50%">${msg.getTime()}</span><br>
						${msg.getMsgContent()}<br>
					</div>
				</c:when>
				<c:otherwise>
					<div class="txtblob" style="float:left; border-radius: 50px 10px 10px 0px;">
						<span style="font-size: 50%">${msg.getTime()}</span> <br>
						${msg.getMsgContent()}<br>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br>
	</div>
	</td></tr>
	<tr><form action="./NewMessage"><td><input type="text" name="txt"></td><td><button type="submit">Send</button></td></form></tr>
	</table>
</div>
</body>
</html>