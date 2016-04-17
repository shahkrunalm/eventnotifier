<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-up Acknowledgement - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Sign up Acknowledgement</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Thank you for registering!</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Your registration is complete. <a
					href='<%=request.getContextPath() + "/login.jsp"%>'
					title="click here to login"> Click here for login</a></td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>