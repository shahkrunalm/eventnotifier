<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Category  | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
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
					<td><input type="submit" value="Add" class="btn btn-primary">
						<input type="reset" class="btn btn-primary"></td>
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