<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Login</td>
			</tr>
		</table>
		<%
			final String code = request.getParameter("code");
			if (code != null && code.equals("3"))
				out.print("To view event details, please login or <a title=\"Click here to sign up\" href=\""
						+ request.getContextPath()
						+ "/sign-up.jsp"
						+ "\">sign up</a>");
			if (code != null && code.equals("0"))
				out.print("Your session expired, please login again");
			else if (code != null && code.equals("1"))
				out.print("Invalid username or password");
			else if (code != null && code.equals("2"))
				out.print("Your account is locked, contact system administrator.");
		%>
		<form name="login-form" id="login-form" action="./UserController"
			method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="login" /></td>
				</tr>
				<tr>
					<td class="bold" width="10%">Username</td>
					<td><input name="username" id="username" /></td>
				</tr>
				<tr>
					<td class="bold">Password</td>
					<td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Login" class="btn btn-primary">
						<input type="reset" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>

	<%@ include file="footer-files.jsp"%>
	<script type="text/javascript">
		$().ready(function() {
			$("#login-form").validate({
				errorClass : "my-error-class",
				rules : {
					username : "required",
					password : "required"
				},
				messages : {
					username : " Please enter username",
					password : " Please enter password"
				}
			});
		});
	</script>
</body>
</html>