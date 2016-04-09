<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Acknowledgement - Curated Event Notifier</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Event Acknowledgement</h4></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td>Your event details are stored successfully.</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
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
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>Event: <a href="add-event.jsp"
								title="Click here to add event">add</a> | <a
								href='<%=request.getContextPath()
					+ "/EventController?action=view-my-event-list&status=-1"%>'
								title="Click here to view my event list">view</a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>