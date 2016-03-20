<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add State - Curated Event Notifier</title>
<%@ include file="header.jsp"%>
</head>
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
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add State</h4></td>
						</tr>
					</table>
					<form name="add-state-form" id="add-state-form"
						action="./StateController" method="post">
						<table width="100%">
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
								<td><input type="submit" value="Add" />&nbsp;&nbsp;<input
									type="reset" value="reset" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>