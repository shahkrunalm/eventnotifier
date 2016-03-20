<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View State - Curated Event Notifier</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<State> stateList = (List<State>) request
				.getAttribute("stateList");
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
							<td><h4>View State List</h4></td>
						</tr>
					</table>
					<%
						if (user != null && user.getType() == 1) {
					%>
					<table>
						<tr>
							<td><a href="add-state.jsp" title="click here to add state">add</a>
								| <a
								href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=1"%>'
								title="click here to view active state list">active</a> | <a
								href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=0"%>'
								title="click here to view de-active state list">de-active</a> |
								<a
								href='<%=request.getContextPath()
						+ "/StateController?action=view-list&status=-1"%>'
								title="click here to view all state list">all</a></td>
						</tr>
					</table>
					<%
						}
					%>
					<br />
					<table border="0" width="100%" id="table-5">
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
								%><span class="boldred">de-active</span> <%
 	} else {
 %><span class="boldgreen">active</span> <%
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