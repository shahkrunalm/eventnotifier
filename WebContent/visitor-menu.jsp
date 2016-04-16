<div class="collapse navbar-collapse navbar-right">
	<ul class="nav navbar-nav">
		<li class="active"><a href="index.jsp">Home</a></li>
		<li><a href="about-us.html">About Us</a></li>
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown">Event <i class="fa fa-angle-down"></i></a>
			<ul class="dropdown-menu">
				<li><a href="add-city.jsp">Upcoming</a></li>
				<li><a href="add-city.jsp">Category</a></li>
				<li><a href="add-city.jsp">State</a></li>
				<li><a href="add-city.jsp">City</a></li>
			</ul></li>
		<li><a href='<%=request.getContextPath() + "/sign-up.jsp"%>'
			title="click here to sign up">Sign up</a></li>
		<li><a href='<%=request.getContextPath() + "/login.jsp"%>'
			title="click here to login">Login</a></li>
	</ul>
</div>