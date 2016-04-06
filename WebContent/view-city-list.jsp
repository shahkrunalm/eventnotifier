<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cities - Curated Event Notifier</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<City> cityList = (List<City>) request.getAttribute("cityList");
	%>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Cities</h4></td>
						</tr>
					</table>
					<table border="0" width="100%" id="table-5">
						<%
							if (cityList.size() == 0) {
						%>
						<tr>
							<td>no city available.</td>
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
								%><span class="boldgreen">active</span> <%
 	} else {
 %><span class="boldred">de-active</span> <%
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