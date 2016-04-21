<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<section id="feature">
	<div class="container">
		<div class="center wow fadeInDown">
			<h2>Events</h2>
			<!-- 
			<p class="lead">
				Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
				eiusmod tempor incididunt ut <br> et dolore magna aliqua. Ut
				enim ad minim veniam
			</p>
			 -->
		</div>

		<div class="row">
			<div class="features">
				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">
						<i class="fa fa-bullhorn"></i>
						<h2>
							<a href="view-past-event-list.jsp"
								title="Click here to view past event list">Past</a>
						</h2>
						<h3><%=((List<Event>) application.getAttribute("pastEventList"))
					.size()%>
							events completed so far...
						</h3>
					</div>
				</div>
				<!--/.col-md-4-->

				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">
						<i class="fa fa-comments"></i>
						<h2>
							<a href="view-ongoing-event-list.jsp"
								title="Click here to view on going event list">On Going</a>
						</h2>
						<h3><%=((List<Event>) application
					.getAttribute("onGoingEventList")).size()%>
							events are on going...
						</h3>
					</div>
				</div>
				<!--/.col-md-4-->

				<div class="col-md-4 col-sm-6 wow fadeInDown"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="feature-wrap">
						<i class="fa fa-cloud-download"></i>
						<h2>
							<a href="view-upcoming-event-list.jsp"
								title="Click here to view upcoming event list">Upcoming</a>
						</h2>
						<h3><%=((List<Event>) application
					.getAttribute("upcomingEventList")).size()%>
							events are planned...
						</h3>
					</div>
				</div>
				<!--/.col-md-4-->

			</div>
			<!--/.services-->
		</div>
		<!--/.row-->
	</div>
	<!--/.container-->
</section>
<!--/#feature-->