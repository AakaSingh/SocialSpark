<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./topBar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" href="./css/userprofile1.css" />
<style>
	#newPost{
		float: left; 
		width: 500px; 
		margin: 30px 0px 0px 0px;
	}
	
	#pbtn
	{
		color: white;
		background-color: lightblue;
		border: none;
		font-size: 150%;
	}
	#pbtn:hover{
		background-color: black;
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
<br><br>

<div id="friends">
<h3>Friends : </h3>
<table>
<c:forEach var="temp" items="${friends}">
	<c:choose>
	<c:when test="${ temp.equals(\"Make Friends +\") }">
			<h3> ${ temp } </h3>
	</c:when>
	<c:otherwise>
	<tr>
	<td><a href="./LoadProfile?profileUser=${temp}">${temp}</a></td>
	<td>
	<c:choose>
		<c:when test="${userFriends.indexOf(temp) == -1 && !(temp.equals(currentUser.getUserName()))}">
				<a href="./FriendActions?friend=${temp}&act=req"><button class="iconbutton"><img src="./images/sendrequest.png" class="icon"></button></a>
		</c:when>
		<c:when test="${userFriends.indexOf(temp) != -1}">
				<a href="./FriendActions?friend=${temp}&act=rem"><button class="iconbutton"><img src="./images/removeuser.png" class="icon"></button></a>
				<a href="./FriendActions?friend=${temp}&act=blk"><button class="iconbutton"><img src="./images/blockuser.png" class="icon"></button></a>
		</c:when>
	</c:choose>
	</c:otherwise>
	</c:choose>
	</td>
	</tr>
</c:forEach>
</table>
</div>

<div id="main">
	<div id="details">
		<div style="float: left;">
			<img src="./images/profile.png" class="profile">
			<h1> ${profileUser.getUserName()}</h1>
		</div>
		<div style="float: right;">
			<c:choose>
				<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
					<a href="./settings.jsp"><button class="iconbutton"><img class="icon" src="./images/settings.png"></button></a>
					<div id="newPost">
					<form action="./PostActions?act=new" method="post">
							<textarea name="postContent" style="border: 3px solid lightblue;"></textarea><br>
							<button type="submit" id="pbtn">Post</button>
					</form>
					</div>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${userFriends.indexOf(profileUser.getUserName()) == -1}">
							<a href="./FriendActions?friend=${profileUser.getUserName()}&act=req"><button class="iconbutton"><img src="./images/sendrequest.png" class="icon"></button></a>
						</c:when>
						<c:when test="${userFriends.indexOf(profileUser.getUserName()) != -1}">
							<a href="./FriendActions?friend=${profileUser.getUserName()}&act=rem"><button class="iconbutton"><img src="./images/removeuser.png" class="icon"></button></a>
							<a href="./FriendActions?friend=${profileUser.getUserName()}&act=blk"><button class="iconbutton"><img src="./images/blockuser.png" class="icon"></button></a>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
			</div>
	</div>

	<div id="tl">
		
	
	
		<c:forEach var="temp" items="${profileUser.getPosts()}">
			<div class="postDiv">
				${profileUser.getUserName()}<br>
				<c:choose>
					<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
					
						<form method="post" action="./PostActions?act=edit&pId=${temp.getPostId()}">
						<textarea name="postContent">${temp.content}</textarea><br>
						<button id="edit" name="edit" type="submit">Save Edit</button>
						</form>
						<a href="./PostActions?act=del&pId=${temp.getPostId()}"><button class="iconbutton"><img src="./images/delete.png" class="icon"></button></a>
					</c:when>
					
					<c:otherwise>
						<textarea disabled>${temp.content}</textarea><br><br>
						<a href="./PostActions?act=sav&pId=${temp.getPostId()}"><button class="iconbutton"><img src="./images/save.png" class="icon"></button></a>	
					</c:otherwise>
				</c:choose>
				
				<a href="./PostActions?act=lik&pId=${temp.getPostId()}"><button class="iconbutton"><img src="./images/like.png" class="icon"></button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/><br>
				<span style="font-size: 60%">${temp.getDate()} </span>	
			</div>
		</c:forEach>
		
		<script>
			function ableDisable()
			{
				  var x = document.getElementById('sv');
				  var y = document.getElementById('svbtn');
				  if (x.style.display === 'none') {
				    x.style.display = 'block';
				    y.value = 'Hide Saved Posts';
				  } else {
				    x.style.display = 'none';
				    y.value = 'View Saved Posts';
				  }
			}
		</script>
		
		<c:choose>
				<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
					<input onclick="ableDisable()" type="button" value="View Saved Posts" id="svbtn"></input>				
					<div id="sv">	
						<c:forEach var="temp" items="${profileUser.getSavedPosts()}">
							<div class="postDiv">
								${allUsers.get(temp.getUserId())}<br>
								<textarea disabled>${temp.content}</textarea><br><br>
								<a href="./PostActions?act=sav&pId=${temp.getPostId()}"><button class="iconbutton"><img src="./images/save.png" class="icon"></button></a>
								<a href="./PostActions?act=lik&pId=${temp.getPostId()}"><button class="iconbutton"><img src="./images/like.png" class="icon"></button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/><br>
								<span style="font-size: 60%">${temp.getDate()} </span>
							</div>
						</c:forEach>
					</div>
				</c:when>
			</c:choose>
	</div>
	
	
</div>
</body>
</html>