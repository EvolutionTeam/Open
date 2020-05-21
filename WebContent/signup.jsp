
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<head>
<title>Open Education Vertex</title>
<link href="img/lap.ico" rel="icon">
<body>
	<style>
body {
	margin: 0;
	padding: 0;
	background: url(img/intro-bg.png);
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

.Create_account {
	width: 400px;
    height: 665px;
    background: rgba(0, 0, 0, 0.5);
    color: #fff;
    top: 53%;
    left: 50%;
    position: absolute;
    transform: translate(-50%, -50%);
    box-sizing: border-box;
    padding: 49px 30px;
    border-radius: 23px;
}

.avatar {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	position: absolute;
	top: -50px;
	left: calc(50% - 50px);
}

.Create_account p {
	margin: 0;
	padding: 0;
	font-weight: bold;
}

.Create_account input {
	width: 100%;
	margin-bottom: 20px;
}

.Create_account input[type="text"], input[type="password"] {
	border: none;
	border-bottom: 1px solid #fff;
	background: transparent;
	outline: none;
	height: 40px;
	color: #fff;
	font-size: 16px;
}

.Create_account input[type="submit"] {
	border: none;
	outline: none;
	height: 40px;
	background: #67b12f;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;
}

.Create_account input[type="submit"]:hover {
	cursor: pointer;
	background: #ffc107;
	color: #000;
}

.Create_account button {
	border: none;
	outline: none;
	height: 40px;
	background: #67b12f;
	color: #fff;
	font-size: 18px;
	border-radius: 20px;
}

.Create_account button:hover {
	cursor: pointer;
	background: #ffc107;
	color: #000;
}

.Create_account a {
	text-decoration: none;
	font-size: 12px;
	line-height: 20px;
	color: darkgrey;
}

.Create_account a:hover {
	color: #ffc107;
}

.error {
	color: #F8981f;
}

#h1_newacc {
	margin: 0;
	padding: 0 0 20px;
	text-align: center;
	font-size: 12px;
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


	<div class="Create_account">
		<img src="img\avatar.svg" class="avatar">

		<h1>Create an Account</h1>

		<form method="POST" action="SignUp">
			<p>First Name</p>
			<input type="text" name="fname" placeholder="Enter Your First Name" required pattern=".{3,}" title="Three or more characters">

			<br> <br>
			<p>Last Name</p>
			<input type="text" name="lname" placeholder="Enter Your Last Name" required pattern=".{3,}" title="Three or more characters">

			<br> <br>
			<p>Username</p>
			<input type="text" name="uname" placeholder="Enter Your Username" required pattern=".{3,}" title="Three or more characters">

			<br> <br>
			<p>Password</p>
			<input type="password" name="password"
				placeholder="Enter Your New Password" required pattern=".{6,}" title="Six or more characters"> <br> <br>
			<p>Email</p>
			<input type="text" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Enter Your Email">

			<br> <br> <input type="submit" name="SIGNUP" 
				value="Sign Up">
			<h1 id="h1_newacc">
				Already have an account? <a href="login.jsp">Sign in</a>.
			</h1>
		</form>
	</div>

</body>
</head>

</html>