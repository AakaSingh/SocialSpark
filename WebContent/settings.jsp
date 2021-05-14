<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="./topBar.jsp"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		
		<style>
			body
			{
				background-image: url('./images/back.png');
				background-position: center;
  				background-repeat: no-repeat;
  				background-size: cover;
			}
			#tx
			{
				width: 200px;
				height: 30px;
				font-size: 120%;
				background-color: black;
				color: white;
			}
			#options
			{
				float : left;
				width: 25%;
				font-family: arial;
				height: 150px;
				box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				color: white;
			}
			#sub
			{
				color: black;
				background-color: red;
				font-weight: bold;
				height: 50px;
				border: none;
				width: 100px;
				margin: auto;
				margin-top: 40px;
				
			}
			#opt
			{
				height: 50px;
				width: 100%;
				font-weight: bold;
			}
			#opt:hover
			{
				background-color: black;
				color: grey;
			}
			#cnfrm
			{
				font-family: arial;
				font-size: 120%;
				float: right;
				width: 70%;
				background-color: #556882;
				color: black;
				height: 200px;
				margin-right: 50px;
				font-weight: bold;
				box-shadow :  0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				
			}
			form
			{
				border: 1px solid black;
				padding: 20px;
				margin: auto;
				margin-top: 20px;
				height: 60%;
				width: 80%;
			}
		</style>
	</head>
	<script>
		function showDel()
		{
			document.getElementById('dltacnt').style.display = 'block';
			document.getElementById('pass').style.display = 'none';
			document.getElementById('clracnt').style.display = 'none';
		}
		function showPass()
		{
			document.getElementById('pass').style.display = 'block';
			document.getElementById('clracnt').style.display = 'none';
			document.getElementById('dltacnt').style.display = 'none';	
		}
		function showClr()
		{
			document.getElementById('clracnt').style.display = 'block';
			document.getElementById('pass').style.display = 'none';
			document.getElementById('dltacnt').style.display = 'none';
		}
	</script>
	<body>
		<div id="options">
			<button id="opt" onclick="showPass()">Change Password</button>
			<button id="opt" onclick="showClr()">Clear Account Data</button>
			<button id="opt" onclick="showDel()">Delete Account</button>
		</div>
		
		<div id="cnfrm">
			<div id="pass">
				<form action="./SettingsActions?act=newpass" method="post">
				Enter New Password : <input type="password" name="pass" id="tx"><br>
				<button type="submit" id="sub">Save Change</button>
				</form>
			</div>
			<div id="clracnt" style="display: none;">
				<form action="./SettingsActions?act=clracnt" method="post">
				Are You Sure You Want To Delete All Account Data?<br>
				<button type="submit" id="sub">Confirm</button>
				</form>
			</div>
			<div id="dltacnt" style="display: none;">
				<form action="./SettingsActions?act=delacnt" method="post">
				Are You Sure You Want To Delete Your Account?<br>
				<button type="submit" id="sub">Confirm</button>
				</form>
			</div>
		</div>
	</body>
</html>