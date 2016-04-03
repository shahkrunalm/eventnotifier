<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login - Curated Event Notifier</title>
<%@ include file="header.jsp"%>
</head>
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
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Login</h4></td>
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
						<table width="100%">
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
								<td><input type="submit" value="Login" /></td>
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