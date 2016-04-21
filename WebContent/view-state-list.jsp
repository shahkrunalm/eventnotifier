<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View State List | Event Notifier</title>
<%
	List<State> stateList = (List<State>) request
			.getAttribute("stateList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View State List</td>
			</tr>
		</table>
		<%
			if (user != null && user.getType() == 1) {
		%>
		<table id="table-with-padding">
			<tr>
				<td><a href="add-state.jsp" title="click here to add state">add</a>
					| <a
					href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=1"%>'
					title="click here to view active state list">active</a> | <a
					href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=0"%>'
					title="click here to view de-active state list">de-active</a> | <a
					href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=-1"%>'
					title="click here to view all state list">all</a></td>
			</tr>
		</table>
		<%
			}
		%>
		<table border="1" width="100%" id="table-with-padding">
			<%
				if (stateList.size() == 0) {
			%>
			<tr>
				<td>No state available.</td>
			</tr>
			<%
				} else {
			%>
			<tr>
			<tr>
				<td class="bold" align="center" width="10%">Sr. No.</td>
				<td class="bold">State Name</td>
				<%
					if (user != null && user.getType() == 1) {
				%>
				<td class="bold" align="center" width="10%">Status</td>
				<%
					}
				%>
			</tr>
			<%
				int i = 0;
					for (State state : stateList) {
			%>
			<tr>
				<td align="center"><%=++i%></td>
				<td><a
					href='<%=request.getContextPath()
							+ "/EventController?action=state&id="
							+ state.getStateId()%>'
					title="Click here to view upcoming events of <%=state.getStateName()%>"><%=state.getStateName()%></a></td>
				<%
					if (user != null && user.getType() == 1) {
				%>
				<td align="center">
					<%
						if (state.getStatus() == 0) {
					%><span class="red">de-active</span> <%
 	} else {
 %><span class="green">active</span> <%
 	}
 %>
				</td>
				<%
					}
				%>
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