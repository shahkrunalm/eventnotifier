<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User List - Curated Event Notifier</title>
<%
	List<User> userList = (List<User>) request.getAttribute("userList");
%>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container  wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View User List</td>
			</tr>
		</table>
		<%
			if (user != null && user.getType() == 1) {
		%>
		<table id="table-with-padding">
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
		<table width="100%" border="1" id="table-with-padding">
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
					%><span class="green">active</span> <%
 	} else {
 %><span class="red">locked</span> <%
 	}
 %>
				</td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>