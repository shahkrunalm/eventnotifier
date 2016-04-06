<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>City Acknowledgement - Curated Event Notifier</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>City Acknowledgement</h4></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td>City added successfully.</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>City: <a href="add-city.jsp"
								title="click here to add city">add</a> | <a
								href='<%=request.getContextPath() + "/CityController?action=view-list&status=-1" %>' title="click here to view city list">view</a>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>