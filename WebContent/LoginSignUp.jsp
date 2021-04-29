<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Login</h1>
<form method='post' action='./Login'>
Username : <input type='text' name='uName'/>
Password : <input type='password' name='pass'/>
<button type='Submit'>Submit</button>
</form>
<br>
<br>
<h1>SignUp</h1>
<form method='post' action='./Register'>
first Name : <input type='text' name='fName'/>
Last Name : <input type='text' name='lName'/>
Username : <input type='text' name='uName'/>
Password : <input type='password' name='pass'/>
<button type='Submit'>Submit</button>
</form>
</body>
</html>