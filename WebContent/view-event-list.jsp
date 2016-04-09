<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event List - Curated Event Notifier</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<Event> eventList = (List<Event>) request
				.getAttribute("eventList");
	%>
	<%@ include file="menu.jsp"%>
	<%--
<%@ include file="check-permission.jsp" %>
 --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Event List</h4></td>
						</tr>
					</table>
					<%
						if (user != null && user.getType() == 1) {
					%>
					<table>
						<tr>
							<td><a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-list&status=1"%>'
								title="Click here to view approved event list">approved</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-list&status=0"%>'
								title="Click here to view pending event list">pending</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-list&status=2"%>'
								title="Click here to view rejected event list">rejected</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-list&status=-1"%>'
								title="click here to view all user list">all</a></td>
						</tr>
					</table>
					<%
						} else if (user != null && user.getType() == 2) {
					%>

					<table>
						<tr>
							<td><a href="add-event.jsp" title="Click here to add event">add</a>
								| <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-my-event-list&status=1"%>'
								title="Click here to view approved event list">approved</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-my-event-list&status=0"%>'
								title="Click here to view pending event list">pending</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-my-event-list&status=2"%>'
								title="Click here to view rejected event list">rejected</a> | <a
								href='<%=request.getContextPath()
						+ "/EventController?action=view-my-event-list&status=-1"%>'
								title="click here to view all user list">all</a></td>
						</tr>
					</table>
					<%
						}
					%>
					<br />
					<table border="0" width="100%" id="table-5">
						<%
							if (eventList.size() == 0) {
						%>
						<tr>
							<td>No event available.</td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td class="bold" align="center" width="10%">Sr. No.</td>
							<td class="bold">Event Name</td>
							<td class="bold" align="center" width="20%">Start Date</td>
							<td class="bold" align="center" width="12%">End Date</td>
							<td class="bold" align="center" width="12%">Category</td>
							<td class="bold" align="center" width="12%">State</td>
							<td class="bold" align="center" width="12%">City</td>
							<td class="bold" align="center" width="10%">Status</td>
						</tr>
						<%
							int i = 0;
								for (Event event : eventList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td><a
								href='<%=request.getContextPath()
							+ "/EventController?action=view&id="
							+ event.getId()%>'
								title="Click here to view event detail"><%=event.getEventName()%></a></td>
							<td align="center"><%=DateUtil.getOnlyDate(event.getStartDate())%></td>
							<td align="center"><%=DateUtil.getOnlyDate(event.getEndDate())%></td>
							<td align="center"><%=event.getCategory().getCategoryName()%></td>
							<td align="center"><%=event.getState().getStateName()%></td>
							<td align="center"><%=event.getCity().getCityName()%></td>
							<td align="center">
								<%
									if (event.getStatus() == 1) {
								%><span class="boldgreen">approved</span> <%
 	} else if (event.getStatus() == 0) {
 %><span class="boldred">pending</span> <%
 	} else if (event.getStatus() == 2) {
 %><span class="boldred">rejected</span> <%
 	}
 %>
							</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>