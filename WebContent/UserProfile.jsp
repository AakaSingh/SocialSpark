<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./topBar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link rel="stylesheet" href="./css/userprofile.css" />

</head>
<body>
<br><br>

<div id="friends">
<h3>Friends : </h3>
<br>
<c:forEach var="temp" items="${friends}">
	<a href="./LoadProfile?profileUser=${temp}">${temp}</a>
	<c:choose>
		<c:when test="${userFriends.indexOf(temp) == -1}">
				<a href="./FriendActions?friend=${temp}&act=req"><img src="./images/sendrequest.png" class="icon"></a>
		</c:when>
		<c:otherwise>
				<a href="./FriendActions?friend=${temp}&act=rem"><img src="./images/removeuser.png" class="icon"></a>
		</c:otherwise>
	</c:choose>
	<br>
</c:forEach>
</div>

<div id="main">
	<div id="details">
		<img src="./images/profile.png" class="profile">
		<h1> ${profileUser.getUserName()}</h1>
	</div>

	<div id="tl">
		<c:choose>
			<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
				<div class="postDiv">
				<form action="./PostActions?act=new" method="post">
					<table>
						<tr><td colspan="3">What's on Your Mind</td></tr>
						<tr><td colspan="3"><textarea name="postContent"></textarea>
						<tr><td><button type="submit">Post</button></td></tr>
					</table>
				</form>
				</div>
			</c:when>
		</c:choose>
	
	
		<c:forEach var="temp" items="${profileUser.getPosts()}">
			<div class="postDiv">
				${profileUser.getUserName()}
				<c:choose>
					<c:when test="${profileUser.getUserName().equals(currentUser.getUserName())}">
					
						<form method="post" action="./PostActions?act=edit&pId=${temp.getPostId()}">
						<textarea name="postContent">${temp.content}</textarea>
						<button id="edit" name="edit" type="submit">Save Edit</button>
						</form>
						<a href="./PostActions?act=del&pId=${temp.getPostId()}"><button>Delete</button></a>
						
					</c:when>
					
					<c:otherwise>
					
						<textarea disabled>${temp.content}</textarea>
						<a href="./PostActions?act=sav&pId=${temp.getPostId()}"><button>Save</button></a>
						
					</c:otherwise>
				</c:choose>
				
				<a href="./PostActions?act=lik&pId=${temp.getPostId()}"><button>Like</button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/></td>
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
		
		<input onclick="ableDisable()" type="button" value="View Saved Posts" id="svbtn"></input>
		
		<div id="sv">	
			<c:forEach var="temp" items="${profileUser.getSavedPosts()}">
				<div class="PostDiv">
					${profileUser.getUserName()}
				
							<textarea disabled>${temp.content}</textarea>
							<a href="./PostActions?act=sav&pId=${temp.getPostId()}"><button>Save</button></a>
					
					<a href="./PostActions?act=lik&pId=${temp.getPostId()}"><button>Like</button></a><input type="text" placeholder="${temp.getLikes()}" disabled id="lik"/></td>
					<span style="font-size: 60%">${temp.getDate()} </span>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
</div>
</body>
</html>