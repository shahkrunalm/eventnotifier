<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Event - Landing Page</title>
<%@ include file="evento-header.jsp"%>
</head>
<body>
	<header id="header">
		<!--== menu ==-->
		<%@ include file="evento-menu.jsp"%>

		<div class="header-cta">
		add category
			<div class="container">
				<div class="row">
				add category
					<div class="entry-content">
						
					</div>
				</div>
			</div>
		</div>

		<div class="header-bg">
			<div id="preloader">
				<div class="preloader"></div>
			</div>
			<div class="main-slider" id="main-slider">

				<!--== Main Slider ==-->
				<ul class="slides">
					<li><img src="evento/images/demo/bg-slide-01.jpg"
						alt="Slide Image" /></li>
					<li><img src="evento/images/demo/bg-slide-02.jpg"
						alt="Slide Image 2" /></li>
				</ul>

			</div>
		</div>
	</header>

	<!--== Testimonial ==-->
	<section id="testimonial" class="testimonial-area">
		<%@ include file="testimonial.jsp"%>
	</section>

	<div class="content mcontent">
		<div id="gotop" class="gotop fa fa-arrow-up"></div>
	</div>
	<!-- contact -->
	<%@ include file="evento-footer.jsp"%>
</body>
</html>