<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message Acknowledgement - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Message Acknowledgement</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Message sent successfully.</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><a href='compose-message.jsp'
					title="click here to compose message">compose</a> | <a
					href='<%=request.getContextPath()
					+ "/MessageController?action=inbox"%>'
					title="click here to go to inbox">inbox</a> | <a
					href='<%=request.getContextPath()
					+ "/MessageController?action=sent"%>'
					title="click here to view sent message">sent</a></td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>