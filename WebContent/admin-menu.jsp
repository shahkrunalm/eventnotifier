<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li class="active"><a href="index.jsp">Home</a></li>
		<li><a href="about-us.html">About Us</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="add-event.jsp">Add</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/EventController?action=view-list&status=-1"%>'
					title="click here to view event list">View</a></li>
				<li><a href="add-city.jsp">Category</a></li>
				<li><a href="add-city.jsp">State</a></li>
				<li><a href="add-city.jsp">City</a></li>
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
			data-toggle="dropdown">Add <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="add-category.jsp">Category</a></li>
				<li><a href="add-state.jsp">State</a></li>
				<li><a href="add-city.jsp">City</a></li>
			</ul></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">View <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
					title="click here to view all category">Category</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=-1"%>'
					title="click here to view state list">State</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=-1"%>'
					title="click here to view city list">City</a></li>
				<li><a href="404.html">404</a></li>
				<li><a href="shortcodes.html">Shortcodes</a></li>
			</ul></li>
		<li><a
			href='<%=request.getContextPath()
					+ "/UserController?action=logout"%>'>Logout</a></li>
	</ul>
</div>