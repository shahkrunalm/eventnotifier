<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event List | Event Notifier</title>
<%
	List<Event> eventList = (List<Event>) request
			.getAttribute("eventList");
%>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View Event List</td>
			</tr>
		</table>
		<%
			if (user != null && user.getType() == 1) {
		%>
		<table id="table-with-padding">
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

		<table id="table-with-padding">
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
		<table border="1" width="100%" id="table-with-padding">
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
				<td align="center"><a
					href='<%=request.getContextPath()
							+ "/EventController?action=category&id="
							+ event.getCategory().getCategoryId()%>'
					title="Click here to view upcoming events of <%=event.getCategory().getCategoryName()%>"><%=event.getCategory().getCategoryName()%></a></td>
				<td align="center"><a
					href='<%=request.getContextPath()
							+ "/EventController?action=state&id="
							+ event.getState().getStateId()%>'
					title="Click here to view upcoming events of <%=event.getState().getStateName()%>"><%=event.getState().getStateName()%></a></td>
				<td align="center"><a
					href='<%=request.getContextPath()
							+ "/EventController?action=city&id="
							+ event.getCity().getCityId()%>'
					title="Click here to view upcoming events of <%=event.getCity().getCityName()%>"><%=event.getCity().getCityName()%></a></td>
				<td align="center">
					<%
						if (event.getStatus() == 1) {
					%><span class="green">approved</span> <%
 	} else if (event.getStatus() == 0) {
 %><span class="red">pending</span> <%
 	} else if (event.getStatus() == 2) {
 %><span class="red">rejected</span> <%
 	}
 %>
				</td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>