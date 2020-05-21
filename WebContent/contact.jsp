<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Open Education Vertex</title>


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

/* Style inputs with type="text", select elements and textareas */
input[type=text], select, textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  background: #007bff;
  color: white;
  padding: 12px 20px;
  border-radius: 4px;
  cursor: pointer;
  border: 2px solid #fff;
}

label{
  color:#FFFFFF;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background: #007bff;
  background-color: #45a049;
  border-color: #fff;
}
</style>
</head>

<body>

	<!--==========================
  Header
  ============================-->
	<header id="header" class="fixed-top">
		<div class="container">

			<div class="logo float-left">

				<h2>Open Education Vertex</h2>
				<h3>Are you Ready to Take the Challenge?</h3>
			</div>

			<nav class="main-nav float-right d-none d-lg-block">
				<ul>
					<li ><a href="index.jsp">Home</a></li>
					<li class="active"><a href="#">Contact US</a></li>
				</ul>
			</nav>
			<!-- .main-nav -->

		</div>
	</header>


	<!--==========================
    Intro Section
  ============================-->
	<section id="intro" class="clearfix">
		<div class="container">

			<div class="intro-img">
				<img src="img/fees.svg" alt="" class="img-fluid">
			</div>

			<div class="intro-info">
				<form method="post" action="ContactUs">
			
				    <label for="fname">Full Name :</label>
				    <input type="text" id="fname" name="firstname" placeholder="Enter Your name here..">
				    
				    <label for="lname">Email :</label>
				    <input type="text" id="Email" name="email" placeholder="Enter Your Email here..">
				
				    <label for="lname">Title :</label>
				    <input type="text" id="title" name="title" placeholder="Enter msg title here..">
				
				    <label for="subject">Description :</label>
				    <textarea id="description" name="description" placeholder="Write something.." style="height:200px"></textarea>
				
				    <input type="submit" value="Send" onclick="showAlert()">
					
			  </form>
			  <script type="text/javascript">
				function showAlert(){
				alert("Thanks for contacting us");
				}
				</script>
			</div>

		</div>
	</section>
	<!-- #intro -->

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>


	<script src="lib/mobile-nav/mobile-nav.js"></script>

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>
</body>
</html>
