<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Acknowledgement - Curated Event Notifier</title>
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
							<td><h4>Category Acknowledgement</h4></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td>Category added successfully.</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>

						<tr>
							<td>Category: <a href="add-category.jsp"
								title="click here to add category">add</a> | <a
								href='<%=request.getContextPath() + "/CategoryController?action=view-list&status=-1" %>' title="click here to view category list">view</a>
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