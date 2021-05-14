<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./topBar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

textarea
{
	background-color: white;
	border: 1px solid lightblue;
	height: 100px;
	width: 90%;
	font-size: 120%;
	margin: auto;
}
.postDiv
{
	box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	background-color: white;
	color: black;
	width: 400px;
	height: 200px;
	border-radius: 5px;
	font-size: 120%;
	padding: 5px;
	border: 1px solid black;
	float: left;
	margin: 20px 50px 20px 50px;
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
body
{
	background-image: url('./images/back.png');
	background-position: center;
  	background-repeat: no-repeat;
  	background-size: cover;
}
</style>

</head>
<body>
<h1 style="font-family: arial; color: white; font-size: 400%">Home Feed</h1>

<c:forEach var="temp" items="${allPosts}">
	<div class="postDiv">
	${allUsers.get(temp.getUserId())}<br>
	<c:choose>
	<c:when test="${currentUser.getUserId() == temp.getUserId()}">
	<form method="post" action="./PostActions?act=edit&pId=${temp.getPostId()}&page=home">
	<textarea name="postContent">${temp.content}</textarea>
	<button id="edit" name="edit" type="submit">Save Edit</button>
	</form>
	<a href="./PostActions?act=del&pId=${temp.getPostId()}&page=home"><button>Delete</button></a>
	</c:when>
	<c:otherwise>
	<textarea disabled>${temp.content}</textarea>
	<td><a href="./PostActions?act=sav&pId=${temp.getPostId()}&page=home"><button>Save</button></a>
	</c:otherwise>
	</c:choose>
	<a href="./PostActions?act=lik&pId=${temp.getPostId()}&page=home"><button>Like</button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/>
	<span style="font-size: 60%">${temp.getDate()} </span>
	
</div>
</c:forEach>

</body>
</html>