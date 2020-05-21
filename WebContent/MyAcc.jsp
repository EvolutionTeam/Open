<%@page import="manager.EncAndDec"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@page import="database.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
	
	

<%
	HttpSession session1 = request.getSession(false);
	String username = (String) session1.getAttribute("username");
%>

<!DOCTYPE html>
<html>
<head>
<%
	String id = request.getParameter("idStd_Inf");
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=username %></title>


<!-- Favicons -->
<link href="img/lap.ico" rel="icon">


<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Russo+One|Viga"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sniglet"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lalezar|Russo+One|Viga"
	rel="stylesheet">
<!--google fonts end-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">


<!-- Index Stylesheet File -->
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
.card h6 {
	float: right;
	color: #48D1CC;
}

input[type=text] {
	width: 100%;
}
</style>
</head>
<body>
<!--==========================
  Header
  ============================-->
	<header id="header" class="fixed-top">
		<div class="container">
		<img style="margin-left:-584px;" class = "intro-img1" alt="Open" src="img/open.jpg" width = "110px" height = "50px" aling = "left">
			<div class="logo float-left">

				<h2>Open Education Vertex</h2>
				<h3>Are you Ready to Take the Challenge?</h3>
			</div>

			<nav class="main-nav float-right d-none d-lg-block" style="(margin-top:80px)">
				<ul>
					<li><a href="">Welcome <span style="color: red;"> <%
 	out.println(username);
 %>
						</span></a></li>
					<li><a href="index.jsp">Sign Out</a></li>
					<li><div class="spinner-grow text-danger" role="status">
					  <span class="sr-only">Loading...</span>
					</div></li>
				</ul>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>

	<div style="margin-top:80px;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			  <a class="navbar-brand" href="MyAcc.jsp">My Account</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNavDropdown">
			    <ul class="navbar-nav">
			      <li class="nav-item active">
			        <a class="nav-link" href="UserView.jsp">Home<span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Time Table</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Result</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Resource</a>
			      </li>
			    </ul>
			  </div>
		</nav>
	</div>

	<%
		dbconnection obj = new dbconnection();
		Connection con = obj.getConnection();
		Statement st = con.createStatement();
		ResultSet res = st.executeQuery("SELECT * FROM  std_inf where u_name='" + username + "'");
		while (res.next()) {
			
			String ID = res.getString("idStd_Inf");
			String name = res.getString("name");
			String contact = res.getString("contact");
			String address = res.getString("address");
			String school = res.getString("school");
			String u_name = res.getString("u_name");
			String password = res.getString("password");
			
			String secretKey = "boooooooooom!!!!";
			
			password = EncAndDec.decrypt(password, secretKey);
			
	%>


	<div class="col-lg-6" style="margin-top:100px; margin-left:300px;">
		<div class="card">
			<div class="card-body card-block">

				<form id="fupForm" method="post" action="UpdateMyAcc">
						<div class="alert alert-success alert-dismissible" id="success"
							style="display: none;">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
						</div>
						<!-- Profile Details -->
						<h4><b>Profile</b></h4><br>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>Name</strong></label> <input type="text"
									name="name" value="<%=name%>" required class="form-control" placeholder="Name">
							</div>
							<div class="form-group col-md-6">
								<label><strong>Contact</strong></label> <input type="text"
									name="contact" value="<%=contact%>" required class="form-control" placeholder="Contact number">
							</div>
							<div class="form-group col-md-6">
								<label><strong>Address</strong></label> <input type="text"
									name="address" value="<%=address%>" required class="form-control" placeholder="No of Heads">
							</div>
							<div class="form-group col-md-6">
								<label><strong>School</strong></label><input
									type="text" name="school" class="form-control" value="<%=school%>" required
									placeholder="Mobile Number">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>User name</strong></label> <input type="text"
									name="uname" value="<%=u_name%>" required pattern=".{3,}" title="Three or more characters" class="form-control" placeholder="No of Heads">
							</div>
							<div class="form-group col-md-6">
								<label><strong>Password</strong></label><input
									type="text" name="password" class="form-control" value="<%=password%>" required
									placeholder="Password">
							</div>
						</div>
						
						

						<input type="hidden" name="id" value="<%=ID%>">
						<div class="form-group">
							<button type="submit" id="butsave" class="btn btn-primary">Update</button>
						</div>
					</form>

			</div>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>