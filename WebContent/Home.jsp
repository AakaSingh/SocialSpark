<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
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
<h1>Home Feed</h1>

<c:forEach var="temp" items="${allPosts}">
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

</body>
</html>