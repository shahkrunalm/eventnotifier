<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li><a href="index.jsp"
			title="Click here to go to home page">Home</a></li>
		<li><a href="search-event.jsp"
			title="Click here to search event by name">Search</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="view-upcoming-event-list.jsp"
					title="Click here to view upcoming event list">Upcoming</a></li>
				<li><a href="view-ongoing-event-list.jsp"
					title="Click here to view on going event list">On Going</a></li>
				<li><a href="view-past-event-list.jsp"
					title="Click here to view past event list">Past</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=1"%>'
					title="click here to view all categories">Categories</a></li>
				<li><a
					href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=1"%>'
					title="click here to view state list">States</a></li>
			</ul></li>
		<li><a href='<%=request.getContextPath() + "/sign-up.jsp"%>'
			title="click here to sign up">Sign up</a></li>
		<li><a href='<%=request.getContextPath() + "/login.jsp"%>'
			title="click here to login">Login</a></li>
	</ul>
</div>