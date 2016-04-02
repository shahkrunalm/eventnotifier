<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Message - Curated Event Notifier</title>
</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%
		Message msg = (Message) request.getAttribute("message");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Message</h4></td>
						</tr>
					</table>
					<table>
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
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<%
						if (msg != null) {
					%>
					<table width="100%">
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
					%>no message available
					<%
						}
					%>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>