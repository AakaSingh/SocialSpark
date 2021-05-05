<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="temp" items="${notifications}">

<c:choose>
<c:when test="${temp.getType() == 1}">
	New Message : ${temp.sender.getUserName()} 
</c:when>
<c:otherwise>
	Friend Request : ${temp.sender.getUserName()}<button>Accept</button>
</c:otherwise>
</c:choose>
</c:forEach>

<a href="./NotificationActions?act=clr">Back to Profile</a>

</body>
</html>