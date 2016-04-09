<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upcoming Event List - Curated Event Notifier</title>

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
							<td><h4>
									View Upcoming Event List -
									<%=request.getParameter("action") + " wise"%></h4></td>
						</tr>
					</table>
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
								title="Click here to view category wise event list"><%=event.getCategory().getCategoryName()%></a></td>
							<td align="center"><a
								href='<%=request.getContextPath()
							+ "/EventController?action=state&id="
							+ event.getState().getStateId()%>'
								title="Click here to view state wise event list"><%=event.getState().getStateName()%></a></td>
							<td align="center"><a
								href='<%=request.getContextPath()
							+ "/EventController?action=city&id="
							+ event.getCity().getCityId()%>'
								title="Click here to view city wise event list"><%=event.getCity().getCityName()%></a></td>
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