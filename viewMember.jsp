<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="controller.*, java.util.*, model.*"%>
<%
	if (session.getAttribute ("LOGIN-STATUS") == null) {
		response.sendRedirect("signup.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Game Store</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="Assignment/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLE CSS -->
<link href="Assignment/assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="Assignment/assets/css/style.css" rel="stylesheet" />
<!-- Favicon -->
<link rel="shortcut icon" href="Assignment/assets/img/favicon.ico" />
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top ">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><strong style=""></strong>Game
					Store<small> Singapore Polytechnic</small></a>

			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right set-links">
					<li><a href="index.jsp"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
					<li><div class="dropdown">
							<a href="allgames.jsp"><button class="dropbtn">
									GAMES <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="action.jsp">Action</a> <a href="adventure.jsp">Adventure</a>
								<a href="horror.jsp" class="active-menu-item">Horror</a> <a
									href="rpg.jsp">RPG</a> <a href="shooter.jsp">Shooter</a>
							</div>
						</div></li>
					<li><a href="about.jsp">ABOUT</a></li>
					<%
						if (session.getAttribute ("LOGIN-STATUS") == null) {
					%>
							<li><a href="login.jsp"> <span
									class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
									LOGIN
							</a></li>
					<%
						} else { 
						%>
							<li><a href="displayShoppingCart.jsp"> <span
									class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
									Shopping Cart
							</a></li>
						<%
							ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
							
							if (viewMembers != null) {
								for(MemberDetails member:viewMembers) {
						%>
							<li><a href="viewMember.jsp"> <span
									class="glyphicon glyphicon-user" aria-hidden="true"></span>
									<%=member.getName()%>
							</a></li>
						<%
								}
							}
						}
						%>					
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->
	<section class="headline-sec">
		<div class="overlay ">
		<%
		ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
	
		if (viewMembers != null) {
			for(MemberDetails member:viewMembers) {
		%>
			<h3>
				WELCOME <%=member.getName()%> <i class="fa fa-angle-double-right "></i>
			</h3>

		</div>
	</section>

	<!--TOP SECTION END-->
	<section>
		<div class = "member">
			<b>Name:</b> <%=member.getName()%><br>
			<b>Mailing Address:</b> <%=member.getMail()%><br>
			<b>Email:</b> <%=member.getEmail()%><br>
			<b>Contact Number:</b> <%=member.getNumber()%><br>
		<%
			}
		}
	%>
		</div>
	</section>

	<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | LIM XIN LI & BAVANI D/O RAMAN |
					All rights reserved | Design by : <a href="http://www.binarytheme.com" target="_blank"
						style="color: #7C7C7C;">binarytheme.com</a>
				</div>
			</div>
		</div>
	</div>
	<!-- COPY TEXT SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="Assignment/assets/js/jquery-1.11.1.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="Assignment/assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="Assignment/assets/js/custom.js"></script>

</body>
</html>
