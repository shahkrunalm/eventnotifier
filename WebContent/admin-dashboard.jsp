<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Dashboard - Curated Event Notifier</title>
</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div id="inner_content">
					<div class="box">
						Event: <a href="add-event.jsp" title="click here to add event">add</a>
						| <a
							href='<%=request.getContextPath()
					+ "/EventController?action=view-list&status=-1"%>'
							title="click here to view event list">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						Category: <a href="add-category.jsp"
							title="click here to add category">add</a> | <a
							href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
							title="click here to view all category">view</a>
					</div>
				</div>

				<div id="inner_content">
					<div class="box">
						Users: <a
							href='<%=request.getContextPath()
					+ "/UserController?action=view-list&status=-1"%>'
							title="click here to view user list">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						Message: <a
							href='compose-message.jsp'
							title="click here to compose message">compose</a> | <a
							href='<%=request.getContextPath()
					+ "/MessageController?action=inbox"%>'
							title="click here to go to inbox">inbox</a> | <a
							href='<%=request.getContextPath()
					+ "/MessageController?action=sent"%>'
							title="click here to view sent message">sent</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						Profile: <a
							href='<%=request.getContextPath()
					+ "/UserController?action=view-profile&id=" + user.getId()%>'
							title="click here to view profile">view</a>
						<!-- | <a
							href="edit-personal-profile.jsp"
							title="click here to edit profile">edit</a>  -->
						| <a href="change-password.jsp"
							title="click here to change password">change password</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						State: <a href="add-state.jsp" title="click here to add state">add</a>
						| <a
							href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=-1"%>'
							title="click here to view state list">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						City: <a href="add-city.jsp" title="click here to add city">add</a>
						| <a href="view-city-list" title="click here to view city list">view</a>
					</div>
				</div>
				<!-- 
			<div id="inner_content">
			<div class="box">
				Status: <a href="view-event-list?status=0" title="click here to view pending event list">pending</a> |
						<a href="view-event-list?status=1" title="click here to view approved event list">approved</a> |
						<a href="view-event-list?status=2" title="click here to view active event list">open</a> | 
						<a href="view-event-list?status=3" title="click here to view closed event list">closed</a>
			</div>
			</div>
			<div id="inner_content">
			<div class="box">
				View Events: <a href="view-state-wise-event-list.jsp" title="click here to view state wise active events">state</a> | 
				<a href="view-category-wise-event-list.jsp" title="click here to view category wise active events">category</a>
			</div>
			</div>

			<div id="inner_content">
			<div class="box">
				Message: <a href="compose-message.jsp" title="click here to compose message">compose</a> | 
						<a href="inbox" title="click here to go to inbox">inbox</a> | 
						<a href="sent-messages" title="click here to view sent message">sent</a>
			</div>
			</div>
			
			
			-->
			</div>
			<br class="clearfix" />
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>