<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
			body
			{
				background-image: url('./images/back.png');
				background-position: center;
  				background-repeat: no-repeat;
  				background-size: cover;
			}
			
			#options
			{
				float : left;
				width: 25%;
				font-family: arial;
				height: 150px;
				box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				color: white;
			}
			#opt
			{
				height: 50px;
				width: 100%;
				font-weight: bold;
			}
			#opt:hover
			{
				background-color: black;
				color: grey;
			}
			a
			{
				color: white;
				text-decoration: none;
			}
			a:hover{
				color: grey;
			}
			
</style>
</head>
<body>
<h1 style="font-family: arial; color: white; font-size: 400%">Notifications</h1>
<c:if test="${notifications.size() != 0 }">
<div id="options">
<c:forEach var="temp" items="${notifications}">
<c:choose>
<c:when test="${temp.getType() == 1}">
	<div id="opt">
	New Message : ${temp.sender.getUserName()} <br>
	</div>
</c:when>
<c:otherwise>
	<div id="opt">
	Friend Request : ${temp.sender.getUserName()}<a href="./NotificationActions?act=acpt&nid=${temp.getNotifId()}&uid=${temp.sender.getUserId()}"><button>Accept</button></a><br>
	</div>
</c:otherwise>
</c:choose>
</c:forEach>
</div>
</c:if>

<br>
<a href="./NotificationActions?act=clr">Back to Profile</a>

</body>
</html>