<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List - Curated Event Notifier</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<User> userList = (List<User>) request.getAttribute("userList");
	%>
	<%@ include file="menu.jsp"%>
	<%--
<%@ include file="check-permission.jsp" %>
 --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View User List</h4></td>
						</tr>
					</table>
					<%
						if (user != null && user.getType() == 1) {
					%>
					<table>
						<tr>
							<td><a
								href='<%=request.getContextPath()
						+ "/UserController?action=view-list&status=1"%>'
								title="click here to view active user list">active</a> | <a
								href='<%=request.getContextPath()
						+ "/UserController?action=view-list&status=0"%>'
								title="click here to view locked user list">locked</a> | <a
								href='<%=request.getContextPath()
						+ "/UserController?action=view-list&status=-1"%>'
								title="click here to view all user list">all</a></td>
						</tr>
					</table>
					<%
						}
					%>
					<br />
					<table border="0" width="100%" id="table-5">
						<%
							if (userList.size() == 0) {
						%>
						<tr>
							<td>No user available.</td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td class="bold" align="center" width="10%">Sr. No.</td>
							<td class="bold">Username</td>
							<td class="bold" align="center" width="20%">Email</td>
							<td class="bold" align="center" width="12%">Mobile</td>
							<td class="bold" align="center" width="12%">Since</td>
							<td class="bold" align="center" width="10%">status</td>
						</tr>
						<%
							int i = 0;
								for (User usr : userList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td><a
								href='<%=request.getContextPath()
							+ "/UserController?action=view-profile&id="
							+ usr.getId()%>'
								title="click here to view user profile"><%=usr.getUsername()%></a></td>
							<td align="center"><%=usr.getEmail()%></td>
							<td align="center"><%=usr.getMobile()%></td>
							<td align="center"><%=DateUtil.getOnlyDate(usr.getMemberSince())%></td>
							<td align="center">
								<%
									if (usr.getStatus() == 1) {
								%><span class="boldgreen">active</span> <%
 	} else {
 %><span class="boldred">locked</span> <%
 	}
 %>
							</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>