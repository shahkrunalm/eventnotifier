<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Event | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table id="table-with-padding" border="0">
			<tr>
				<td></td>
			</tr>
		</table>
		<section id="feature" class="transparent-bg">
			<div class="container">
				<div class="center wow fadeInDown">
					<form action="./EventController">
						<table id="table-with-padding">
							<tr>
								<td class="bold">Search Event &nbsp;&nbsp;&nbsp;&nbsp; <input
									type="hidden" name="action" value="search" /> <input
									type="text" placeholder="Search event name" name="search">
									<i class="fa fa-search"></i></td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
			</div>
			<!--/.container-->
		</section>
		<%@ include file="events.jsp"%>
		<!--/#feature-->
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>