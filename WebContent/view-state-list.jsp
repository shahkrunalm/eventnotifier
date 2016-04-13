<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View State List - Curated Event Notifier</title>
<%
	List<State> stateList = (List<State>) request
			.getAttribute("stateList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View State List</td>
			</tr>
		</table>
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
				<td class="bold" align="center" width="10%">Status</td>
			</tr>
			<%
				int i = 0;
					for (State state : stateList) {
			%>
			<tr>
				<td align="center"><%=++i%></td>
				<td><%=state.getStateName()%></td>
				<td align="center">
					<%
						if (state.getStatus() == 0) {
					%><span class="red">de-active</span> <%
 	} else {
 %><span class="green">active</span> <%
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