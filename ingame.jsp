<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,db.*,controller.*, java.util.ArrayList, model.*"%>
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
<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico" />
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
								<a href="horror.jsp">Horror</a> <a href="rpg.jsp">RPG</a> <a
									href="shooter.jsp">Shooter</a>
							</div>
						</div></li>
					<li><a href="about.jsp">ABOUT</a></li>
					<%
						if (session.getAttribute ("LOGIN-STATUS") != "YES") {
					%>
					<li><a href="login.jsp"> <span
							class="glyphicon glyphicon-log-in" aria-hidden="true"></span>
							LOGIN
					</a></li>
					<%
						} else { 
																			ArrayList<MemberDetails> viewMembers = (ArrayList<MemberDetails>)session.getAttribute("results");
																			
																			if (viewMembers != null) {
																				for(MemberDetails member:viewMembers) {
					%>
					<li><div class="dropdown">
							<a href="viewMember.jsp"><button class="dropbtn">
									<span class="glyphicon glyphicon-user"></span>
									<%=member.getName()%>
									<span class="caret"></span>
								</button></a>
							<div id="myDropdown" class="dropdown-content dropdown-menu-right">
								<a href="ViewShoppingCartServlet?hiddenID=<%=member.getId()%>">Shopping
									Cart</a> <a href="logoutMember.jsp" onclick="Logout()">Logout</a>
							</div>
							<script>
								function Logout() {
									alert('Successfully logged out!');
								}
							</script>
						</div></li>
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
	<%
		String id = request.getParameter("hiddenID");
		
			Connection conn = DatabaseConnection.getConnection();

			String sql = "Select *,genre_name from game_data gd, genre g, game_genre gg WHERE g.genre_id = gg.genre_id AND gg.game_id = gd.game_id AND gd.game_id=?";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
		int dbgameid = rs.getInt("game_id");
		String dbgametitle = rs.getString("game_title");
		String dbcompany = rs.getString("company");
		Date dbdate = rs.getDate("release_date");
		String dbdescription = rs.getString("description");
		double dbprice = rs.getDouble("price");
		String newdbprice = String.format("%.2f", dbprice);
		String dbimageloc = rs.getString("image_loc");
		String dbgenrename = rs.getString("genre_name");
		int dbpreowned = rs.getInt("preowned");
		int dbquantity = rs.getInt("quantity");
	%>
	<section class="headline-sec">
	<div class="overlay ">
		<h3>
			<%=dbgametitle%>
			<i class="fa fa-angle-double-right"></i>
	</div>
	</section>
	<!-- HOME SECTION END -->

	<img src="<%=dbimageloc%>/img1.jpg" alt="" id="first" height="470"
		width="390" />
	<div class="inside">
		<p>
			Title:
			<%=dbgametitle%><br>
		</p>
		<p>
			Company:
			<%=dbcompany%><br>
		</p>
		<p>
			Release Date:
			<%=dbdate%><br>
		</p>
		<p>
			Description:
			<%=dbdescription%><br>
		</p>
		<p>
			Price:
			<%
			if (dbprice == 0) {
					out.println("<td>TBC</td><br>");
				} else {
		%><%="$" + newdbprice%><br>
			<%
				}
			%>
		</p>
		<p>
			Genre Name:
			<%=dbgenrename%><br>
		</p>
		<p>
			<%
				if (dbpreowned == 1) {
							out.println("<td>Pre-owned</td>");
						} else {
							out.println("<td>Brand new</td>");
						}
			%>
		</p>

		<%-- <form action="Add2CartServlet" method="post">
			<input type="hidden" name="hiddenID" value="<%=dbgameid%>" /> <input
				type="submit" class="btn btn-info" id="submit-button5" name="cart"
				value="Add to Cart" /><br>
		</form> --%>
		
		<%
			if (session.getAttribute ("LOGIN-STATUS") == "YES" && (dbprice != 0)) {
		%>
		<form action="Add2CartServlet" method="get">
    		<input type="hidden" name="gameid" value="<%=dbgameid%>"/>
    		<input type="hidden" name="gametitle" value="<%=dbgametitle%>"/>
    		<input type="hidden" name="price" value="<%=newdbprice%>"/>
    		<% 
    		ArrayList<MemberDetails> Members = (ArrayList<MemberDetails>)session.getAttribute("results");
			
			if (Members != null) {
				for(MemberDetails viewmember:Members) {
			%>		
			<input type="hidden" name="memberid" value="<%=viewmember.getId()%>"/>
			<%
					}
				}
			%>
			<div id="buycopies">
			<br><input type="number" name="quantity" min="1" max="<%=dbquantity%>" class="form-control">
			<input type="submit" class="btn btn-info" id="submit-button7" value="Add To Cart" />
			</div>
			</form>		
		<%
			}
		%>
	</div>
	<div class="ingame">
		<img src="<%=dbimageloc%>/img2.jpg" alt="" height="230" width="230" />
		<img src="<%=dbimageloc%>/img3.jpg" alt="" height="230" width="230" />
		<img src="<%=dbimageloc%>/img4.jpg" alt="" height="230" width="230" />
		<img src="<%=dbimageloc%>/img5.jpg" alt="" height="230" width="230" />
		<img src="<%=dbimageloc%>/img6.jpg" alt="" height="230" width="230" />
	</div>
	<hr>
	<div id="commentarea">
		<form action="commentprocess.jsp">
			Name: <input type="text" name="name" id="name" class="form-control" />
			<div id="rating">
				Ratings: <br /> 5<span class="glyphicon glyphicon-star" /><input
					type="radio" id="star5" value="5" name="rating" title="Rocks!" /> 4<span
					class="glyphicon glyphicon-star" /><input type="radio" id="star4"
					value="4" name="rating" title="Pretty good" /> 3<span
					class="glyphicon glyphicon-star" /><input type="radio" id="star3"
					value="3" name="rating" title="Meh" /> 2<span
					class="glyphicon glyphicon-star" /><input type="radio" id="star2"
					value="2" name="rating" title="Kinda bad" /> 1<span
					class="glyphicon glyphicon-star" /><input type="radio" id="star1"
					value="1" name="rating" title="Sucks big time" />
			</div>
			Comment:
			<textarea name="comment" id="comment" class="form-control"></textarea>
			<br /> <input type="submit" class="btn btn-info" id="submit-button4"
				value="Submit">
		</form>
		<form action="viewcomment.jsp">
			<input type="hidden" name="hiddenID" value="<%=dbgameid%>" />
		</form>
	</div>
	<%
		}
			conn.close();
	%>
	<div class="copy-txt">
		<div class="container">
			<div class="row">
				<div class="col-md-12 set-foot">
					&copy 2016 Singapore Polytechnic | LIM XIN LI & BAVANI D/O RAMAN |
					All rights reserved | Design by : <a
						href="http://www.binarytheme.com" target="_blank"
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