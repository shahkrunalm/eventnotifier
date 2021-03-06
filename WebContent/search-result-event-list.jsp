<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Searched Event List - Curated Event Notifier</title>
<%
	List<Event> eventList = (List<Event>) request
			.getAttribute("eventList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Event List - condition is pending for status 1 n status 3</td>
			</tr>
		</table>
		<table id="table-with-padding" border="0">
			<tr>
				<td>
					<form action="./EventController">
						<input type="hidden" name="action" value="search" /> <input
							type="text" placeholder="Search event name" name="search"> <i
							class="fa fa-search"></i>
					</form>
				</td>
			</tr>
		</table>
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