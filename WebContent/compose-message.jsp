<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Message | Event Notifier</title>
<%
	String messageTo = null;
	messageTo = (String) request.getAttribute("messageTo");
	if (messageTo == null) {
		messageTo = "";
	}
%>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container  wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Compose Message</td>
			</tr>
		</table>
		<table id="table-with-padding">
			<tr>
				<td><a href='compose-message.jsp'
					title="click here to compose message">compose</a> | <a
					href='<%=request.getContextPath()
					+ "/MessageController?action=inbox"%>'
					title="click here to go to inbox">inbox</a> | <a
					href='<%=request.getContextPath()
					+ "/MessageController?action=sent"%>'
					title="click here to view sent message">sent</a></td>
			</tr>
		</table>
		<form name="send-message-form" id="send-message-form"
			action="./MessageController" method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="send" /></td>
				</tr>
				<tr>
					<td width="10%" class="bold">To</td>
					<td><input value="<%=messageTo%>" name="messageTo"
						id="messageTo" /></td>
				</tr>

				<tr>
					<td width="10%" class="bold">Subject</td>
					<td><input name="subject" id="subject" /></td>
				</tr>

				<tr>
					<td class="bold">Content</td>
					<td><textarea rows="5" cols="25" name="content"></textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Send" class="btn btn-primary">
						<input type="reset" class="btn btn-primary"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
	<script type="text/javascript">
		$().ready(function() {
			$("#send-message-form").validate({
				errorClass : "my-error-class",
				rules : {
					messageTo : {
						required : true,
						email : true
					},
					subject : "required",
					content : "required",
				}
			});
		});
	</script>
</body>
</html>