<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<style>

.postDiv
{
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	padding: 10px;
	background-image : linear-gradient(to right, rgba(105, 34, 199,0), rgba(105, 34, 199,1));
	float : left;
}
</style>

</head>
<body>

<h1> Current User : ${currentUser} </h1>

<h1> ${profileUser} 's Profile</h1>

<h3>Friends : </h3>
<table>
<c:forEach var="temp" items="${friends}">
	<tr><td><a href="./LoadProfile?profileUser=${temp}">${temp}</a></td></tr>
</c:forEach>
</table>

<c:forEach var="temp" items="${profileUser.getPosts()}">
<div class="postDiv">
<table>
<tr><td>${profileUser}</td></tr>
<tr><td> ${temp.getDate()} </td></tr>
<tr><td><textarea>${temp.content}</textarea></td></tr>
<c:if test="${profileUser.getUserName().equals(currentUser.getUserName())}">
<tr><td><button id="edit" name="edit">Edit</button></td></tr>
</c:if>
</table>
</div>
</c:forEach>


</body>
</html>