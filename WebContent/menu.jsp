<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.*"%>
<div id="wrapper">
	<div id="page">
		<div id="content">
			<div class="box">


				<%
					User user = null;
					user = (User) session.getAttribute("user");
					if (user == null) {
				%>
				<table border="0" width="100%">
					<tr>
						<td><span class="logo">Curated Event Notifier</span></td>
						<td align="right"><a href='<%=request.getContextPath() + "/index.jsp"%>'
							title="click here to go to home page">Home</a> | <a
							href='<%=request.getContextPath() + "/login.jsp"%>'
							title="click here to login">Login</a> | <a
							href='<%=request.getContextPath() + "/sign-up.jsp"%>'
							title="click here to sign up">Sign up</a></td>
					</tr>
				</table>

				<%
					} else {
				%><table border="0" width="100%">
					<tr>
					<td><span class="logo">Curated Event Notifier</span></td>
						<td>
							<%
								out.print("Welcome back, " + user.getFirstname());
							%>
						</td>
						<td align="center">
							<%
								out.print("Your last login: "
											+ session.getAttribute("lastLogin"));
							%>
						</td>
						<td align="right"><a
							href='<%=request.getContextPath() + "/index.jsp"%>'
							title="click here to go to home page">Home</a> | <%
							if (user.getType() == 1) {
						%><a href='<%=request.getContextPath() + "/admin-dashboard.jsp"%>'
							title="click here to go to dashboard">Dashboard</a> | <%
							} else {
						%><a href='<%=request.getContextPath() + "/user-dashboard.jsp"%>'
							title="click here to go to dashboard">Dashboard</a> | <%
							}
						%> <a
							href='<%=request.getContextPath()
						+ "/UserController?action=logout"%>'>Logout</a></td>
					</tr>
				</table>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<br class="clearfix" />
</div>
