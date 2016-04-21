<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>City Acknowledgement | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">City Acknowledgement</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>City added successfully.</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><a href="add-city.jsp" title="click here to add city">add</a>
					| <a
					href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=-1"%>'
					title="click here to view city list">view</a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>