<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/two_column_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.20.custom.css" />
<script src="js/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<title>Welcome to Curated Event Notifier</title>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#login-form").validate({
			errorClass : "my-error-class",
			rules : {
				username : "required",
				password : "required"
			},
			messages : {
				username : " Please enter username",
				password : " Please enter password"
			}
		});
	});
</script>
<body>
	<%
		User user = null;
		user = (User) session.getAttribute("user");
		List<Event> eventList = (List<Event>) application
				.getAttribute("upcomingEventList");
	%>
	<div id="wrapper">
		
			<div id="rowcontent">
				<div class="box">
					<table border="0" width="100%">
						<tr>
							<td><span class="logo">Curated Event Notifier</span></td>
							<td align="right"><a
								href='<%=request.getContextPath() + "/index.jsp"%>'
								title="click here to go to home page">Home</a> | <a
								href='<%=request.getContextPath() + "/login.jsp"%>'
								title="click here to login">Login</a> | <a
								href='<%=request.getContextPath() + "/sign-up.jsp"%>'
								title="click here to sign up">Sign up</a></td>
						</tr>
					</table>
				</div>
			</div>
<div id="page">
			<div id="content">
				<div class="box">
					<a href='<%=request.getContextPath() + "/index.jsp"%>'>Home</a> |
					<%
						if (user != null) {
							if (user.getType() == 1) {
					%><a href='<%=request.getContextPath() + "/admin-dashboard.jsp"%>'
						title="click here to go to dashboard">Dashboard</a> |
					<%
						} else {
					%><a href='<%=request.getContextPath() + "/user-dashboard.jsp"%>'
						title="click here to go to dashboard">Dashboard</a> |
					<%
						}
					%><a
						href='<%=request.getContextPath()
						+ "/UserController?action=logout"%>'>Logout</a>
					<%
						} else {
					%><a href='<%=request.getContextPath() + "/sign-up.jsp"%>'>Sign
						up</a>
					<%
						}
					%>
					<br> <br>
					<table border="0" width="100%" id="table-5">
						<tr>
							<td align="left" class="bold">Upcoming Events</td>
						</tr>
					</table>
					<%
						if (eventList.size() == 0) {
					%>No event available, please visit us after sometime.<%
						} else {
							for (Event event : eventList) {
					%>
					<table id="table-page-heading" border="0">
						<tr>
							<td colspan="4" align="left"><b>Event Name: </b><a
								href='<%=request.getContextPath()
							+ "/EventController?action=view&id="
							+ event.getId()%>'
								title="view event details"><%=event.getEventName()%></a></td>
						</tr>
						<tr>
							<td colspan="4" align="left"><b>Venue: </b> <%=event.getAddress() + ", " + event.getCity().getCityName()
							+ ", " + event.getPincode() + " "
							+ event.getState().getStateName()%></td>
						</tr>
						<!-- 
						<tr>
							<td class="bold" width="25%">Category</td>
							<td width="25%"><a
								href="view-event-by-category?category=<%=event.getCategory()%>"
								title="view event details by this category"><%=event.getCategory()%></a></td>
							<td class="bold" width="25%">State</td>
							<td width="25%"><a
								href="view-event-by-state?state=<%=event.getState()%>"
								title="view event details by this category"><%=event.getState()%></a></td>
						</tr>
						 -->
						<tr>
							<td class="bold" width="25%">Start Date & Time</td>
							<td width="25%"><%=DateUtil.getOnlyDate(event.getStartDate()) + " "
							+ event.getStartTime()%></td>
							<td class="bold" width="25%">End Date & Time</td>
							<td width="25%"><%=DateUtil.getOnlyDate(event.getEndDate()) + " "
							+ event.getEndTime()%></td>
						</tr>
					</table>
					<%
						}
						}
					%>

				</div>

			</div>
			<!-- div content end -->
			<%
				if (user == null) {
			%>
			<div id="sidebar">
				<div class="box">
					<form name="login-form" id="login-form" action="./UserController"
						method="post">
						<table border="0" width="100%" id="table-5">
							<tr>
								<td align="left" class="bold">Login</td>
							</tr>
						</table>
						<table border="0" width="100%">
							<tr>
								<td class="bold" width="10%"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="action" value="login" /></td>
							</tr>
							<tr>
								<td class="bold">&nbsp;Username <span class="boldred">*</span></td>
							</tr>
							<tr>
								<td>&nbsp;<input name="username" id="username" /></td>
							</tr>
							<tr>
								<td class="bold">&nbsp;Password <span class="boldred">*</span></td>
							</tr>
							<tr>
								<td>&nbsp;<input type="password" name="password"
									id="password" /></td>
							</tr>
							<tr>
								<td>&nbsp;<input type="submit" value="Login" /></td>
							</tr>
							<tr>
								<td class="bold"><a href="sign-up.jsp"
									title="click here to register">Sign up</a></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- div sidebar end -->
			<%
				} else {
			%>
			<div id="sidebar">
				<div class="box">
					<span class="bold">State wise events</span> <br> coming soon
				</div>
				<br> <span class="bold">Category wise events</span> <br>
				coming soon
				<div class="box"></div>
			</div>
			<!-- div sidebar end -->
			<%
				}
			%>
			<br class="clearfix" />
		</div>
		<!-- div page end -->
	</div>
	<!-- div wrapper end -->
	<%@ include file="footer.jsp"%>
</body>
</html>