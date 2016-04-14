<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Add Category</td>
			</tr>
		</table>
		<form name="category-form" id="category-form"
			action="./CategoryController" method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="add" /></td>
				</tr>
				<tr>
					<td width="12%" class="bold">Category Name</td>
					<td><input name="categoryName" id="categoryName" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Add" />&nbsp;&nbsp;<input
						type="reset" value="Reset" /></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
	<script type="text/javascript">
		$().ready(function() {
			$("#category-form").validate({
				errorClass : "my-error-class",
				rules : {
					categoryName : "required",
				}
			});
		});
	</script>
</body>
</html>