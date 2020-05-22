<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	HttpSession session1 = request.getSession(false);
	String username = (String) session1.getAttribute("username");
%>
<!DOCTYPE HTML>
<head>
    <style>
         .body {
                margin: 0;
                padding: 0;    
            }
            form {
                padding-top: 150px;
                padding-left: 200px;
                
            }
            input {
                position: relative;
                display: inline-block;
                font-size: 20px;
                box-sizing: border-box;
                transition: .5s;
            }
            input[type="text"] {
                background:  #bcbfcb;
                width: 700px;
                height: 50px;
                border: 1px;
                padding: 0 20px;
                border-radius: 25px 0 0 25px;
            }
            input[type="submit"] {
                position:relative;
                border-radius: 0 25px 25px 0;
                height: 50px;
                width: 200px;
                border: none;
                outline: none;
                cursor: pointer;
                background: #274ee9;
                
            }
          /*  input[type="submit"]:hover {
                background: #ff5722;
            }*/
            .card h6 {
	float: right;
	color: #48D1CC;
}
        </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=username %></title>

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
<link href="css/examview.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

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

			<nav class="main-nav float-right d-none d-lg-block" style="margin-top:80px">
				<ul>
					<li><a href="">Welcome <span style="color: red;"> <%out.println(username);%>
						</span></a></li>
					<li><a href="index.jsp">Sign Out</a></li>
				</ul>
			</nav>
		

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
			        <a class="nav-link" href="examview.jsp">Exam</a>
			      </li>
                              <li class="nav-item">
			        <a class="nav-link" href="assignmentview.jsp">Assignment</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#">Resource</a>
			      </li>
			    </ul>
			  </div>
		</nav>
	</div>
 <div class="para">
     <h1 style="padding-top: 25px; padding-bottom: -15px; color: #0e1f62;">Exam results</h1> 
 </div>

        <table width="1200px" align="center" padding-left="15px;"
               style="border:1px solid #000000; border: none;" >
               
            <tr>
                <td colspan=5 align="center"
                    style="background-color:#274ee9; ">
                    <b>Exam Result Records</b></td>
            </tr>
            <tr style="background-color:#3e61ec;">
                <td scope="col"><b>Record ID</b></td>
                <td scope="col"><b>Index No:</b></td>
                <td scope="col"><b>Grade</b></td>
                <td scope="col"><b>Subject</b></td>
                <td scope="col"><b>Result</b></td>
            </tr>
         
            <%
                int count = 0;
                String color = "#798fea";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#798fea";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
            </tr>
           
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=5 align="center"
                    style="background-color:#798fea"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
        </table>
    </body>
</html>