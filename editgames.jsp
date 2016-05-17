<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<title>SP Game Store</title>
<!-- BOOTSTRAP CORE STYLE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLE CSS -->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- CUSTOM STYLE CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
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
				<a class="navbar-brand" href="#"><strong style=""></strong>Game
					Store<small> Singapore Polytechnic</small></a>

			</div>
			<div class="navbar-collapse collapse move-me">
				<ul class="nav navbar-nav navbar-right set-links">
					<li><a href="welcome.jsp"><span
							class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
							VIEW</a></li>
					<li><div class="dropdown">
							<a href="#"><button class="dropbtn">
									<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
									EDIT <span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content">
								<a href="editgames.jsp" class="active-menu-item">Games</a> <a
									href="editgenres.jsp">Genres</a>
							</div>
						</div></li>
					<li><a href="login.html"> <span
							class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
							LOGOUT
					</a></li>
				</ul>
			</div>

		</div>
	</div>
	<!--MENU SECTION END-->
	<section class="headline-sec">
	<div class="overlay ">
		<h3>
			EDIT GAMES <i class="fa fa-angle-double-right "></i>
		</h3>

	</div>
	</section>
	<!--TOP SECTION END-->
	
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	<a href="addgame.html" class="new-release-font"> ADD</a><br>
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	<a href="updategame.html" class="new-release-font"> UPDATE</a><br>
	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	<a href="deletegame.html" class="new-release-font"> DELETE</a>


	<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | All rights reserved | Design by
					: <a href="http://www.binarytheme.com" target="_blank"
						style="color: #7C7C7C;">binarytheme.com</a>
				</div>
			</div>
		</div>
	</div>
	<!-- COPY TEXT SECTION END-->
	<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	<!-- CORE JQUERY  -->
	<script src="assets/js/jquery-1.11.1.js"></script>
	<!-- BOOTSTRAP SCRIPTS  -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- CUSTOM SCRIPTS  -->
	<script src="assets/js/custom.js"></script>
</body>
</html>