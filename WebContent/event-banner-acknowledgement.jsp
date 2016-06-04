<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Acknowledgement | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Event Banner Acknowledgement</td>
			</tr>
		</table>
		<table width="100%" id="table-with-padding">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Your event banner uploaded successfully.</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><a href="add-event.jsp" title="Click here to add event">add</a>
					| <a
					href='<%=request.getContextPath()
					+ "/EventController?action=view-my-event-list&status=-1"%>'
					title="Click here to view my event list">view</a></td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>