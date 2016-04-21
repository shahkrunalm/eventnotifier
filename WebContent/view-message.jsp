<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Message | Event Notifier</title>
<%
	Message msg = (Message) request.getAttribute("message");
%>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View Message</td>
			</tr>
		</table>
		<table id="table-with-padding">
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
		<%
			if (msg != null) {
		%>
		<table width="100%" id="table-with-padding">
			<tr>
				<td width="10%" class="bold">From</td>
				<td><%=msg.getMessageFrom()%></td>
			</tr>
			<tr>
				<td width="10%" class="bold">To</td>
				<td><%=msg.getMessageTo()%></td>
			</tr>
			<tr>
				<td class="bold">Date</td>
				<td><%=DateUtil.getFormattedDate(msg.getMessageOn())%></td>
			</tr>
			<tr>
				<td class="bold">Subject</td>
				<td><%=msg.getSubject()%></td>
			</tr>
			<tr>
				<td class="bold" valign="top">Content</td>
				<td><%=msg.getContent()%></td>
			</tr>
		</table>
		<%
			} else {
		%>No message available
		<%
			}
		%>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>