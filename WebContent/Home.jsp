<%@page import="database.dbconnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
	HttpSession session1 = request.getSession(false);
	String username = (String) session1.getAttribute("username");
%>>

<!DOCTYPE html>
<html>
<head>
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

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">


<!-- Index Stylesheet File -->
<link href="css/index.css" rel="stylesheet" type="text/css">
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

			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li><a href="">Welcome <span style="color: red;"> <%out.println(username);%>
						</span></a></li>
					<li><a href="#">My Account</a></li>
					<li><a href="index.jsp">Sign Out</a></li>
					<li><div class="spinner-grow text-primary" role="status">
						  <span class="sr-only">Loading...</span>
						</div>
					</li>
					
				</ul>
				<script>
                                    var winref;
                                    var id = 1;
                                    function Myacc() {
                                        winref = window.open('MyAcc.jsp?Eventid=<%=username%>', 'popwin', 'width=840, height=480,top=' + (screen.height - 480) / 4 + ' left=' + (screen.width - 840) / 2 + '');
                                    }
                                </script>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>


	<!--==========================
    Intro Section
  ============================-->
	<section id="intro" class="clearfix">
		<div class="container">
			<h3 style="color: white">Student's Information</h3>
			
			<!-- Search form -->
			<input class="form-control" type="text" placeholder="Search" aria-label="Search"><br>
			
			<form action="SignUp" method="get">
			
			<button type="submit" onclick="report()"  class="btn btn-warning">Report</button>
			
			</form>
								<script>
									function report() {
							  		alert("Downloading Student information PDF");}
								</script>
			<br><br>
			
			<!-- Search form 
			<div class="active-cyan-3 active-cyan-4 mb-4">
			  <input class="form-control" type="text" placeholder="Search student details" aria-label="Search">
			</div>
			<br>  -->
			
			
			<table class="table" style="background: white; width: 100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>DOB</th>
						<th>Gender</th>
						<th>Contact</th>
						<th>Address</th>
						<th>School</th>
						<th>Grade</th>
						<th>Subjects</th>
						<th>U_name</th>
					<!--<th>Password</th> 
						<th>QR_IFP</th>  -->
					</tr>
				</thead>
				<tbody>
					<%
						dbconnection obj = new dbconnection();
						Connection con = obj.getConnection();
						Statement st = con.createStatement();
						ResultSet res = st.executeQuery("SELECT * FROM  Std_Inf");
						while (res.next()) {
							String ID = res.getString("idStd_Inf");
							String Name = res.getString("name");
							String DOB = res.getString("dob");
							String Gender = res.getString("gender");
							String Contact = res.getString("contact");
							String Address = res.getString("address");
							String School = res.getString("school");
							String Grade = res.getString("grade");
							String Subject = res.getString("subject");
							String U_name = res.getString("u_name");
						    String Password = res.getString("password");
							String QR_IFP = res.getString("qr_code");
					%>
					<script>
                                    var winref;
                                    var id = 1;
                                    function pop<%=ID%>() {
                                        winref = window.open('Edit.jsp?idStd_Inf=<%=ID%>', 'popwin', 'width=840, height=480,scrollbars=yes','top=' + (screen.height - 480) / 4 + ' left=' + (screen.width - 840) / 2 + '');
                                    }
                                </script>
					<tr class="warning">
						<td>
							<%
								out.println(ID);
							%>
						</td>
						<td>
							<%
								out.println(Name);
							%>
						</td>
						<td>
							<%
								out.println(DOB);
							%>
						</td>
						<td>
							<%
								out.println(Gender);
							%>
						</td>
						<td>
							<%
								out.println(Contact);
							%>
						</td>
						<td>
							<%
								out.println(Address);
							%>
						</td>
						<td>
							<%
								out.println(School);
							%>
						</td>
						<td>
							<%
								out.println(Grade);
							%>
						</td>
						<td>
							<%
								out.println(Subject);
							%>
						</td>
						<td>
							<%
								out.println(U_name);
							%>
						</td>
					<!--<td>
							<%
								out.println(Password);
							%>
						</td>
						<td>
							<%
								out.println(QR_IFP);
							%>
						</td>   -->

						<td><button type="button" onclick="pop<%=ID%>()" class="btn btn-success">Edit</button></td>
						<td><form action="DeleteRequest" method="post">
								<input type="hidden" name="id" value="<%=ID%>">
								<button type="submit" onclick="myFunction1()" class="btn btn-danger">Delete</button>
								<script>
									function myFunction1() {
							  		alert("Student information removed!");}
								</script>
							</form></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<div class="intro-img">
				<img src="img/intro-img.svg" alt="" class="img-fluid">
			</div>

			<div class="intro-info">
				<div class="container"></div>
			</div>

		</div>
	</section>
	
	
	<!-- #intro -->
	
	
	<a class="btn btn-warning btn-lg"
		style="position: fixed; bottom: 50px; right: 30px;" href="#head"
		data-toggle="modal" data-target="#myModal">Student Registration</a>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Add new student details</h4>
				</div>
				<div class="modal-body">
					<form id="fupForm" method="post" action="GetQuote">
						<div class="alert alert-success alert-dismissible" id="success"
							style="display: none;">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
						</div>
						
						<!-- Student Details -->
						<h4><b>Student's information</b></h4>
						
						<div class="form-group">
							<label><strong>Name</strong></label>
						</div>
						<div class="form-group">
							<input type="text" required  name="name" class="form-control">
						</div>
						
						<div class="form-group">
							<label><strong>Date of Birth</strong></label>
						</div>
						<div class="form-group">
							<input type="date" required name = "dob" class="form-control">
						</div>
						
						<div class="form-group">
							<label><strong>Gender</strong></label>
						</div>
						<div class="form-group">
							<input type="radio" id="male" name="gender" value="male">
							<label for="male">Male</label><br>
							<input type="radio" id="female" name="gender" value="female">
							<label for="female">Female</label>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>Number to contact</strong></label><input required 
								type="text" name="contact" class="form-control" 
								placeholder="Mobile Number">
							</div>
							
							<div class="form-group col-md-6">
									<label><strong>Address</strong></label>
									<textarea class="form-control" name="address" rows="" cols=""
										required placeholder="Please Type Item by item"></textarea>
							</div>
						</div>
						
						<!-- Class Details -->
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>School</strong></label>
								<input type="text" required name="school" class="form-control">
							</div>
							<div class="form-group col-md-6">
								<label><strong>Grade</strong></label>
								<select name="grade" class="form-control" required>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label><strong>Subject</strong></label>
						</div>
							<div class="form-group">
								
									<label class="c">Sinhala
									  <input type="checkbox" name ="subject" value="Sinhala">
									  <span class="Subjects"></span>
									</label>
									<label class="c">Maths
									  <input type="checkbox"name ="subject" value="Maths">
									  <span class="Subjects"></span>
									</label>
									<label class="c">Science
									  <input type="checkbox"name ="subject" value="Science">
									  <span class="Subjects"></span>
									</label>
									<label class="c">English
									  <input type="checkbox"name ="subject"value="English">
									  <span class="Subjects"></span>
									</label>
									<label class="c">History
									  <input type="checkbox"name ="subject"value="History">
									  <span class="Subjects"></span>
									</label>
									<label class="c">ICT
									  <input type="checkbox"name ="subject" value="ICT">
									  <span class="Subjects"></span>
									</label>
							</div>
						
						<!-- Sign in details -->
						<h4><b>Sign in details</b></h4>
						
						<div class="form-group col-md-6">
							<div class="form-group">
								<label for="email"><b>User Name</b></label>
							</div>
							<div class="form-group">
							    <input type="text" placeholder="User Name" name="u_name" required>
							</div>
						</div>
						
						<div class="form-group col-md-6">
					  		<div class="form-group">
							    <label for="psw"><b>Password</b></label>
							</div>						
							<div class="form-group">
							    <input type="text" placeholder="Enter Password" name="password" required pattern=".{6,}" title="Six or more characters">
							</div>
						</div>
						
						<div class="form-group col-md-6">
							<div class="form-group">
							    <label for="psw-repeat"><b>Repeat Password</b></label>
							</div>
							<div class="form-group">
							    <input type="text" placeholder="Repeat Password" name="Password" required pattern=".{6,}" title="Six or more characters">
							</div>
						</div>
						 
						    <hr>
						<p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
			
						<div class="form-group">
							<button type="submit" id="butsave" class="btn btn-primary">Save information</button>
							
						</div>
					</form>
				</div>
		
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>


	<script src="lib/mobile-nav/mobile-nav.js"></script>

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>
</body>
</html>
