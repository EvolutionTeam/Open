<%@page import="manager.EncAndDec"%>
<%@page import="database.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String id = request.getParameter("idStd_Inf");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=id%></title>

<!-- Favicons -->
<link href="img/lap.ico" rel="icon">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

</head>
<body>
	<%
		dbconnection obj = new dbconnection();
		Connection con = obj.getConnection();   
		Statement st = con.createStatement();
		ResultSet res = st.executeQuery("SELECT * FROM  std_inf where  idstd_inf ='" + id + "'");
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
			
			String secretKey = "boooooooooom!!!!";
			Password = EncAndDec.decrypt(Password, secretKey);

	%>
	

	<div class="col-lg-6">
		<div class="card">
			<div class="card-body card-block">

				<form id="fupForm" method="post" action="UpdateInfor">
						<div class="alert alert-success alert-dismissible" id="success"
							style="display: none;">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
						</div>
						
						<!-- Student update details -->
						<h3 style="color: black">Update Stusent's Details</h3><br>
						<div class="form-group">
							<label><strong>Name</strong></label>
						</div>
						<div class="form-group">
							<input type="text" required  name="name" value="<%=Name%>" class="form-control">
						</div>
						
						<div class="form-group">
							<label><strong>Date of Birth</strong></label>
						</div>
						<div class="form-group">
							<input type="date" required name = "dob" value="<%=DOB%>" class="form-control">
						</div>
						
						<div class="form-group">
							<label><strong>Gender</strong></label>
						</div>
						
						<div class="form-group">
							<input type="radio" id="male" name="gender"  value="Male" <%if(Gender == "male") %>>
							<label for="male" >Male</label><br>
							<input type="radio" id="female" name="gender" value="Female" checked>
							<label for="female" >Female</label>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>Number to contact</strong></label><input required 
								type="text" name="contact" class="form-control"  value="<%=Contact%>"
								placeholder="Mobile Number">
							</div>
							
							<div class="form-group col-md-6">
									<label><strong>Address</strong></label>
									<input required 
								type="text" name="address" class="form-control"  value="<%=Address%>"
								placeholder="Please Type Item by item">
									
							</div>
						</div>
						
						<!-- Class Details -->
						
						<div class="form-row">
							<div class="form-group col-md-6">
								<label><strong>School</strong></label>
								<input type="text" required name="school" value="<%=School%>" class="form-control">
							</div>
							<div class="form-group col-md-6">
								<label><strong>Grade</strong></label>
								<select name="grade" class="form-control">
									<option value="6" value="<%=Grade%>">6</option>
									<option value="7" value="<%=Grade%>">7</option>
									<option value="8" value="<%=Grade%>">8</option>
									<option value="9" value="<%=Grade%>">9</option>
									<option value="10" value="<%=Grade%>">10</option>
									<option value="11" value="<%=Grade%>">11</option>
									<option value="12" value="<%=Grade%>">12</option>
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
							
							<h4><b>Sign in details</b></h4>
							
							<div class="form-group">
								<label for="email"><b>User Name</b></label>
							</div>
							<div class="form-group">
							    <input type="text" placeholder="User Name" value="<%=U_name%>" name="u_name" required>
							</div>
							
							<div class="form-group">
							    <label for="psw"><b>Password</b></label>
							</div>						
							<div class="form-group">
							    <input type="text" placeholder="Reset Password"  value="<%=Password%>" name="password" required pattern=".{6,}" title="Six or more characters">
							</div>
							<hr>
						
						
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