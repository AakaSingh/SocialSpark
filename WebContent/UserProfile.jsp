<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<style>
body
{
	background-image : linear-gradient(to right, rgba(105, 34, 199,0), rgba(105, 34, 199,1));
}

.postDiv
{
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	background-color: black;
	color: grey;
	float : left;
	margin: 30px;
	width: 200px;
	height: 300px;
}
textarea
{
	background-color: white;
	height: 200px;
	width: 200px;
	border: none;
}
table
{
	border: none;
	border-collapse: collapse;
	width: 100%;
	height: 100%;
}

#lik
{
	height: 20px;
	width: 20px;
	text-align: center;
	vertical-align: middle:
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
	<c:choose>
		<c:when test="${userFriends.indexOf(temp) == -1}">
				<a href=".FriendActions/friend=${temp}&act=req"><button>Send Request</button></a>
		</c:when>
		<c:otherwise>
				<a href=".FriendActions/friend=${temp}&act=rem"><button>Remove Friend</button></a>
		</c:otherwise>
	</c:choose>
</c:forEach>
</table>

<c:forEach var="temp" items="${profileUser.getPosts()}">
<div class="postDiv">
	<table>
	<tr><td>${profileUser.getUserName()}</td></tr>
	<tr>
	<c:choose>
	<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
	<form method="post" action="./PostActions?act=edit&pId=${temp.getPostId()}">
	<td  colspan = "3"><textarea name="postContent">${temp.content}</textarea></td>
	<tr><td><button id="edit" name="edit" type="submit">Save Edit</button></td>
	</form>
	<td><a href="./PostActions?act=del&pId=${temp.getPostId()}"><button>Delete</button></a></td>
	</c:when>
	<c:otherwise>
	<tr><td  colspan = "3"><textarea disabled>${temp.content}</textarea></td></tr>
	<td><a href="./PostActions?act=sav&pId=${temp.getPostId()}"><button>Save</button></a></td>
	</c:otherwise>
	</c:choose>
	<tr><td><a href="./PostActions?act=lik&pId=${temp.getPostId()}"><button>Like</button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/></td>
	<tr><td> <span style="font-size: 60%">${temp.getDate()} </span></td></tr>
	</table>
</div>
</c:forEach>
<br>
<c:if test="${profileUser.getUserName().equals(currentUser.getUserName())}">
<a href = "FriendsList.jsp">Chat</a>
</c:if>

</body>
</html>