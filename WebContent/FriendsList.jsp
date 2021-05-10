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

<table>
<c:forEach var="temp" items="${userFriends}">
	<tr><td><a href="./LoadMessages?chat=${temp}">${temp}</a></td></tr>
</c:forEach>
</table>

</body>
</html>