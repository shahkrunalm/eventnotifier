<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard | Event Notifier</title>
</head>

<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container  wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Dashboard</td>
			</tr>
		</table>
		<table id="table-with-padding">
			<tr>
				<td>
					<%
						out.print("Welcome back, " + user.getFirstname());
					%>
				</td>
			</tr>
			<tr>
				<td>
					<%
						out.print("Your last login: " + session.getAttribute("lastLogin"));
					%>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>
