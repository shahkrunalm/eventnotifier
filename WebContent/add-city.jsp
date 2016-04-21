<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add City | Event Notifier</title>
<%
	List<State> stateList = (List<State>) application
		.getAttribute("loadedStateList");
%>
</head>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td colspan="2">Add City</td>
			</tr>
		</table>
		<form name="add-city-form" id="add-city-form"
			action="./CityController" method="post">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="10%"></td>
					<td><input type="hidden" name="action" value="add" /></td>
				</tr>
				<tr>
					<td class="bold" width="10%">State</td>
					<td><select name="stateId" id="stateId">
							<option value="">Select</option>
							<%
								for (State state : stateList) {
							%><option value="<%=state.getStateId()%>"><%=state.getStateName()%></option>
							<%
								}
							%>
					</select></td>
				</tr>
				<tr>
					<td class="bold">City Name</td>
					<td><input name="cityName" id="cityName" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="Add"  class="btn btn-primary">
						<input type="reset" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
	<script type="text/javascript">
		$().ready(function() {
			$("#add-city-form").validate({
				errorClass : "my-error-class",
				rules : {
					cityName : "required",
					stateId : "required"
				},
				messages : {
					stateId : " Please select state"
				}
			});
		});
	</script>
</body>
</html>