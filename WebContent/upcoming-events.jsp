<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<section id="services" class="service-item">
	<div class="container">
		<div class="center wow fadeInDown">
			<h2>Upcoming Events</h2>
			<!-- 
			<p class="lead">
				Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
				eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut
				enim ad minim veniam
			</p>
			 -->
		</div>

		<div class="row">

			<div class="col-sm-6 col-md-4">
				<div class="media services-wrap wow fadeInDown">
					<div class="pull-left">
						<img class="img-responsive" src="images/services/services1.png">
					</div>
					<div class="media-body">
						<h3 class="media-heading">
							<a
								href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=1"%>'
								title="click here to view all categories">Categories</a>
						</h3>
						<p><%=((List<Category>) application
					.getAttribute("loadedCategoryList")).size()%>
							categories. Introducing categories soon. Stay tuned...
						</p>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-4">
				<div class="media services-wrap wow fadeInDown">
					<div class="pull-left">
						<img class="img-responsive" src="images/services/services2.png">
					</div>
					<div class="media-body">
						<h3 class="media-heading">
							<a
								href='<%=request.getContextPath()
					+ "/StateController?action=view-list&status=1"%>'
								title="click here to view state list">States</a>
						</h3>
						<p>
							Covered
							<%=((List<State>) application
					.getAttribute("loadedStateList")).size()%>
							of out 29 states. Excited to explore more...
						</p>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-4">
				<div class="media services-wrap wow fadeInDown">
					<div class="pull-left">
						<img class="img-responsive" src="images/services/services3.png">
					</div>
					<div class="media-body">
						<h3 class="media-heading">
							<a
								href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=1"%>'
								title="click here to view state list">Cities</a>
						</h3>
						<p>It shows just how little of our galaxy we've explored so
							far</p>
					</div>
				</div>
			</div>
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/#services-->