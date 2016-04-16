<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Change Password</td>
			</tr>
		</table>
		<%
			String code = null;
			code = (String) request.getAttribute("code");
			if (code != null) {
				if (code.equals("1")) {
		%><span class="green">Password changed successfully.</span>
		<%
			} else if (code.equals("2")) {
		%><span class="red">Your current password and new password are
			same, please provide new password.</span>
		<%
			} else {
		%><span class="red">Your current password is invalid, try again</span>
		<%
			}
			}
		%>
		<form name="change-password-form" id="change-password-form"
			action="./UserController" method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="change-password" /></td>
				</tr>
				<tr>
					<td class="bold" width="14%">Current Password</td>
					<td><input name="password" id="password" type="password" /></td>
				</tr>
				<tr>
					<td class="bold">New Password</td>
					<td><input name="new_password" id="new_password"
						type="password" /></td>
				</tr>
				<tr>
					<td class="bold">Confirm Password</td>
					<td><input name="confirm_password" id="confirm_password"
						type="password" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Change Password"
						type="password" /></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
	<script type="text/javascript">
		$().ready(function() {
			$("#change-password-form").validate({
				errorClass : "my-error-class",
				rules : {
					password : {
						required : true,
						minlength : 6
					},
					new_password : {
						required : true,
						minlength : 6
					},
					confirm_password : {
						required : true,
						minlength : 6,
						equalTo : "#new_password"
					}
				}
			});
		});
	</script>
</body>
</html>