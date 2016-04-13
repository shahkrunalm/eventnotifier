<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<header id="header">
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-4">
					<div class="top-number">
						<p>
							<i class="fa fa-phone-square"></i> +0123 456 70 90
						</p>
					</div>
				</div>
				<div class="col-sm-6 col-xs-8">
					<div class="social">
						<ul class="social-share">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-skype"></i></a></li>
						</ul>
						<div class="search">
							<form role="form">
								<input type="text" class="search-form" autocomplete="off"
									placeholder="Search"> <i class="fa fa-search"></i>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/.container-->
	</div>
	<!--/.top-bar-->

	<nav class="navbar navbar-inverse" role="banner">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><img
					src="corlate/images/logo.png" alt="logo"></a>
			</div>

			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.html">Home</a></li>
					<li><a href="about-us.html">About Us</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu">
							<li><a href="add-category.jsp">Add</a></li>
							<li><a href="add-state.jsp">View</a></li>
							<li><a href="add-city.jsp">Category</a></li>
							<li><a href="add-city.jsp">State</a></li>
							<li><a href="add-city.jsp">City</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Message <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu">
							<li><a
								href='<%=request.getContextPath()
					+ "/MessageController?action=inbox"%>'
								title="click here to go to inbox">Inbox</a></li>
							<li><a href='compose-message.jsp'
								title="click here to compose message">Compose</a></li>
							<li><a
								href='<%=request.getContextPath()
					+ "/MessageController?action=sent"%>'
								title="click here to view sent message">Sent</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Add <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu">
							<li><a href="add-category.jsp">Category</a></li>
							<li><a href="add-state.jsp">State</a></li>
							<li><a href="add-city.jsp">City</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">View <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu">
							<li><a
								href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
								title="click here to view all category">Category</a></li>
							<li><a
								href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=-1"%>'
								title="click here to view state list">State</a></li>
							<li><a
								href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=-1"%>'
								title="click here to view city list">City</a></li>
							<li><a href="404.html">404</a></li>
							<li><a href="shortcodes.html">Shortcodes</a></li>
						</ul></li>
					<li><a href="contact-us.html">Contact</a></li>
				</ul>
			</div>
		</div>
		<!--/.container-->
	</nav>
	<!--/nav-->

</header>
<!--/header-->
<%
	User user = null;
	user = (User) session.getAttribute("user");
%>