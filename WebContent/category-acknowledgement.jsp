<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Acknowledgement - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Category Acknowledgement</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td>Category added successfully.</td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td><a href="add-category.jsp"
					title="click here to add category">add</a> | <a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
					title="click here to view category list">view</a></td>
			</tr>
		</table>
		<hr>
	</div>
</body>
</html>