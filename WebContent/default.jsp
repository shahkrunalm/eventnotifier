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

		<!--== site description ==-->
		<%@ include file="site-description.jsp"%>

	</header>

	<div class="content">
		<div class="container box">
			<!--== About us ==-->
			<section id="about" class="about-us">
				<%@ include file="about-us.jsp"%>
			</section>

			<!--== Schedule ==-->
			<section id="schedule" class="row">
				<%@ include file="schedule.jsp"%>
			</section>

			<!--== Blog ==-->
			<section id="blog" class="row">
				<%@ include file="blog.jsp"%>
			</section>
			<!--== Pricing Tables ==-->
			<section id="prices" class="row">
				<%@ include file="pricing.jsp"%>
			</section>
			<!--== Sign up ==-->
			<section id="signup" class="row">
				<%@ include file="evento-sign-up.jsp"%>
			</section>
			<!--== Team ==-->
			<section id="team" class="team">
				<%@ include file="team.jsp"%>
			</section>
		</div>
	</div>
	<!--== Testimonial ==-->
	<section id="testimonial" class="testimonial-area">
		<%@ include file="testimonial.jsp"%>
	</section>

	<div class="content mcontent">
		<div id="gotop" class="gotop fa fa-arrow-up"></div>
	</div>
	<!-- Contact Area -->
	<section id="contact" class="mapWrap">
		<%@ include file="contact-us.jsp"%>
		<%@ include file="social-links.jsp"%>
	</section>
	<!-- contact -->
	<%@ include file="evento-footer.jsp"%>
</body>
</html>