<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add State - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Add State</td>
			</tr>
		</table>
		<form name="add-state-form" id="add-state-form"
			action="./StateController" method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="add" /></td>
				</tr>
				<tr>
					<td class="bold" width="10%">State Name</td>
					<td><input name="stateName" id="stateName" /></td>
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
			$("#add-state-form").validate({
				errorClass : "my-error-class",
				rules : {
					stateName : "required",
				}
			});
		});
	</script>
</body>


</html>