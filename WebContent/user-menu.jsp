<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li><a href="index.jsp" title="Click here to go to home page">Home</a></li>
		<li><a href="user-dashboard.jsp" title="Click here to go to dashboard">Dashboard</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="add-event.jsp">Add</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/EventController?action=view-my-event-list&status=-1"%>'
					title="Click here to view my event list">View</a></li>
				<li><a href="view-upcoming-event-list.jsp"
					title="Click here to view upcoming event list">Upcoming</a></li>
				<li><a href="#">Category</a></li>
				<li><a href="#">State</a></li>
				<li><a href="#">City</a></li>
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Message <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a
					href='<%=request.getContextPath()
					+ "/MessageController?action=inbox"%>'
					title="click here to go to inbox">Inbox</a></li>
				<li><a href='compose-message.jsp'
					title="click here to compose message">Compose</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/MessageController?action=sent"%>'
					title="click here to view sent message">Sent</a></li>
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Profile <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a
					href='<%=request.getContextPath()
					+ "/UserController?action=view-profile&id="
					+ ((User) session.getAttribute("user")).getId()%>'
					title="click here to view profile">View</a></li>
				<li><a href="change-password.jsp"
					title="click here to change password">Change Password</a></li>
			</ul></li>
		<li><a
			href='<%=request.getContextPath()
					+ "/UserController?action=logout"%>'>Logout</a></li>
	</ul>
</div>