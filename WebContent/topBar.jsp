<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

#topBar
{
	background-color: lightblue;
	font-family: arial;
	height:50px;
	width: 100%;
	vertical-align: middle;
}

#top
{
	float: right;
	display: inline-block;
	margin: 10px;
}

#myDropdown
{
	float: left;
	display: inline-block;
}

#myInput {
  box-sizing: border-box;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;

}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown-content {
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: none;
}

.dropdown a:hover {background-color: #ddd;}

</style>


<script>

function filter()
{
	  var input, filter, ul, li, a, i;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  div = document.getElementById("myDropdown");
	  a = div.getElementsByTagName("a");
	  for (i = 0; i < a.length; i++) {
	    txtValue = a[i].textContent || a[i].innerText;
	    if (txtValue.toUpperCase().startsWith(filter) && filter != "") {
	      a[i].style.display = "block";
	    } else {
	      a[i].style.display = "none";
	    }
	  }
}

</script>

</head>
<body>
<div id="topBar">
	<div id="myDropdown" class="dropdown-content">
	    <input type="text" placeholder="Search.." id="myInput" onkeyup="filter()">
	    
	    <c:forEach var="temp" items="${allUsers.values()}">
	    	<a href="./LoadProfile?profileUser=${temp}">${temp}</a>
	    </c:forEach>
	    
	</div>
	
	<div id="top">
	  	<a href="./LogOut"><button id="logout">LogOut</button></a>
  	</div>
  	
  	<div id="top">
  		<c:if test="${profileUser.getUserName().equals(currentUser.getUserName())}">
		<a href="./Notifications.jsp">Notifications : ${notifications.size()}</a>
		</c:if>
  	</div>
  	
  	<div id="top">
  		<a href="./LoadHomePage">Home</a>
  	</div>
  	
  	<div id="top">
  		<a href="./LoadProfile?profileUser=${currentUser.getUserName()}">Profile</a>
  	</div>
  	
  	<div id="top">
  		<a href = "FriendsList.jsp"><img src="./images/chat.png" class="icon"></a>
  	</div>
</div>
</body>
</html>