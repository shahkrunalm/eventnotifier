<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li class="active"><a href="index.jsp" title="Click here to go to home page">Home</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="view-upcoming-event-list.jsp" title="Click here to view upcoming event list">Upcoming</a></li>
				<li><a href="#">Category</a></li>
				<li><a href="#">State</a></li>
				<li><a href="#">City</a></li>
			</ul></li>
		<li><a href='<%=request.getContextPath() + "/sign-up.jsp"%>'
			title="click here to sign up">Sign up</a></li>
		<li><a href='<%=request.getContextPath() + "/login.jsp"%>'
			title="click here to login">Login</a></li>
	</ul>
</div>