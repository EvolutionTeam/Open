<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
<title>Open Education Vertex</title>
<link href="img/lap.ico" rel="icon">
<style>
.C {
	width: 500px;
	height: 200px;
	top: 12%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	padding: 70px 30px;
}

body {
	margin: 0;
	padding: 0;
	background:url(img/intro-bg.png);
	background-size: cover;
	background-position: center;
	font-family: sans-serif;
}

h1 {
	margin: 0;
	padding: 0 0 20px;
	text-align: center;
	font-size: 22px;
}

h2 {
	margin: 0;
	padding: 0 0 0px;
	text-align: center;
	font-size: 50px;
	font-family: Freestyle Script;
	color: #67b12f;
}

.loginbox {
	width: 320px;
	height: 420px;
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	top: 50%;
	left: 50%;
	position: absolute;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	padding: 70px 30px;
	border-radius: 20px;
}

.avatar {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px);
}

.icon {
	width: 500px;
	height: 200px;
	border-radius: 50%;
	top: 10%;
	left: 50%;
	position: absolute;
	left: calc(50% 50px);
}

.loginbox p {
	margin: 0;
	padding: 0;
	font-weight: bold;
}

.loginbox input {
	width: 100%;
	margin-bottom: 20px;
}

.loginbox input[type="text"], input[type="password"] {
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
}

.loginbox input[type="submit"] {
	border: none;
	outline: none;
	height: 40px;
	background: #67b12f;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;
}

.loginbox input[type="submit"]:hover {
	cursor: pointer;
	background: #ffc107;
	color: #000;
}

.loginbox a {
	text-decoration: none;
	font-size: 12px;
	line-height: 20px;
	color: darkgrey;
}

.loginbox a:hover {
	color: #ffc107;
}

.error {
	color: #FF7800;
}

.btn {
	float: right;
	margin: 50px;
	text-decoration: none;
	padding: 5px 20px;
	font-family: "Roboto", sans-serif;
	font-size: 15px;
	border: 2px solid white;
	color: white;
}

.btn:hover {
	background-color: #67b12f;
	color: white;
	border: 2px solid #67b12f;
}

::placeholder {
	color: darkgrey;
	opacity: 1;
	/* Firefox */
}

:-ms-input-placeholder {
	/* Internet Explorer 10-11 */
	color: darkgrey;
}

::-ms-input-placeholder {
	/* Microsoft Edge */
	color: darkgrey;
}
</style>
<body>




	<div class="loginbox">
		<img src="img\avatar.svg" class="avatar">
		<h1>Login</h1>

		<form action="login" method="post">
			<p>Username</p>
			<input type="text" name="user" placeholder="Enter Your Username" required pattern=".{3,}" title="Three or more characters">
			<p>Password</p>
			<input type="password" name="pass" placeholder="Enter Your Password" required pattern=".{6,}" title="Six or more characters">
			<!-- <span class="error"><?php echo $LOGINERR;?></span><br><a> -->
			<input type="submit" name="login" value="Login">
			<!-- <a href="Recover_password_step1.php">Forgot password?</a><br> -->
			<a href="signup.jsp">Don't have an account?</a>
		</form>

	</div>

</body>
</head>

</html>