<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Acknowledgement - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Event Acknowledgement</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">

			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Your event details are stored successfully.</td>
			</tr>

			<tr>
				<td></td>
			</tr>
			<tr>
				<td>We will verify your event details and update you soon.</td>
			</tr>
			<%-- 
						<tr>
							<td><a href="file-upload.jsp"
								title="click here to upload file">Upload Event Banner</a></td>
						</tr>
						--%>
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