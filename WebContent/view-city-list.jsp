<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View City List - Curated Event Notifier</title>

<%
	List<City> cityList = (List<City>) request.getAttribute("cityList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View City List</td>
			</tr>
		</table>
		<table id="table-with-padding">
			<tr>
				<td><a href="add-city.jsp" title="click here to add state">add</a>
					| <a
					href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=1"%>'
					title="click here to view active city list">active</a> | <a
					href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=0"%>'
					title="click here to view de-active city list">de-active</a> | <a
					href='<%=request.getContextPath()
					+ "/CityController?action=view-list&status=-1"%>'
					title="click here to view all city list">all</a></td>
			</tr>
		</table>
		<table border="1" width="100%" id="table-with-padding">
			<%
				if (cityList.size() == 0) {
			%>
			<tr>
				<td>No city available.</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td class="bold" align="center">Sr. No.</td>
				<td class="bold" align="center">City Id</td>
				<td class="bold">City Name</td>
				<td class="bold" align="center">State Name</td>
				<td class="bold" align="center">Status</td>
			</tr>
			<%
				int i = 0;
					for (City city : cityList) {
			%>
			<tr>
				<td align="center" width="12%"><%=++i%></td>
				<td align="center" width="12%"><%=city.getCityId()%></td>
				<td><%=city.getCityName()%></td>
				<td align="center" width="12%"><%=city.getState().getStateName()%></td>
				<td align="center" width="12%">
					<%
						if (city.getStatus() == 1) {
					%><span class="green">active</span> <%
 	} else {
 %><span class="red">de-active</span> <%
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