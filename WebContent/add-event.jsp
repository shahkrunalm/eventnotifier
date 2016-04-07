<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Event - Curated Event Notifier</title>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#add-event-form").validate({
							errorClass : "my-error-class",
							rules : {
								eventName : "required",
								description : "required",
								startDate : "required",
								endDate : "required",
								address : "required",
								landmark : "required",
								cityId : "required",
								pincode : {
									required : true,
									digits : true,
									minlength : 6,
									maxlength : 6
								},
								stateId : "required",
								categoryId : "required",
								organizedBy : "required",
								contactPerson : "required",
								phoneNo : {
									required : false,
									digits : true
								},
								faxNo : {
									required : false,
									digits : true
								},
								mobileNo : {
									required : true,
									digits : true,
									minlength : 10,
									maxlength : 10
								},
								website : {
									required : false,
									url : true
								},
								emailId : {
									required : false,
									email : true
								},
								fee : {
									required : "#isChargeable:checked"
								}
							}
						});

						$("#stateId")
								.change(
										function() {
											stateId = $("#stateId").val();
											if (!isNaN(stateId)
													&& stateId != "") {
												$
														.ajax({
															url : "/eventnotifier/CityController?action=get_cities&stateId="
																	+ stateId,
															success : function(
																	result) {
																var x = document
																		.getElementById("cityId");
																x.length = 0;
																var str = result
																		.split(",");
																var len = str.length - 1;
																for (var i = 0; i < len; i++) {
																	var option = document
																			.createElement("option");
																	var str1 = str[i]
																			.split(":");
																	option.value = str1[0];
																	option.text = str1[1];
																	try {
																		x
																				.add(
																						option,
																						x.options[null]);
																	} catch (e) {
																		x
																				.add(
																						option,
																						null);
																	}
																}
															}
														});
											}
										});
						$(function() {
							$("#startDate").datepicker({
								changeMonth : true,
								changeYear : true,
								dateFormat : "dd-mm-yy",
								minDate : "0m +0w",
								maxDate : "18m +0w"
							});
						});

						$(function() {
							$("#endDate").datepicker({
								changeMonth : true,
								changeYear : true,
								dateFormat : "dd-mm-yy",
								minDate : "0m +0w",
								maxDate : "18m +0w"
							});
						});
					});
</script>
</head>
<%
	List<Category> categoryList = (List<Category>) application
			.getAttribute("loadedCategoryList");
	List<State> stateList = (List<State>) application
			.getAttribute("loadedStateList");
%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add Event</h4></td>
						</tr>
					</table>
					<form action="./EventController" method="post"
						name="add-event-form" id="add-event-form">
						<table width="100%" border="0">
							<tr>
								<td class="bold" width="10%"></td>
								<td><input type="hidden" name="action" value="add" /></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Event Name</td>
								<td><input name="eventName" /></td>
							</tr>
							<tr>
								<td class="bold">Description</td>
								<td><textarea rows="5" cols="25" name="description"
										id="description"></textarea></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Start Date</td>
								<td><input name="startDate" id="startDate" /></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Start Time</td>
								<td><select name="startHour">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select> <select name="startMinute">
										<option value="00">00</option>
										<option value="15">15</option>
										<option value="30">30</option>
										<option value="45">45</option>
								</select> <select name="startAMPM">
										<option value="AM">AM</option>
										<option value="PM">PM</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="10%">End Date</td>
								<td><input name="endDate" id="endDate" /></td>
							</tr>

							<tr>
								<td class="bold" width="10%">End Time</td>
								<td><select name="endHour">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select> <select name="endMinute">
										<option value="00">00</option>
										<option value="15">15</option>
										<option value="30">30</option>
										<option value="45">45</option>
								</select> <select name="endAMPM">
										<option value="AM">AM</option>
										<option value="PM">PM</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Address</td>
								<td><input name="address" /></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Landmark</td>
								<td><input name="landmark" /></td>
							</tr>

							<tr>
								<td class="bold" width="10%">State</td>
								<td><select name="stateId" id="stateId">
										<option value="">select</option>
										<%
											for (State state : stateList) {
										%><option value="<%=state.getStateId()%>"><%=state.getStateName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold">City</td>
								<td><select id="cityId" name="cityId">
										<option>select</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Pincode</td>
								<td><input name="pincode" /></td>
							</tr>
							<tr>
								<td class="bold">Category</td>
								<td><select name="categoryId" id="categoryId">
										<option value="">select</option>
										<%
											for (Category category : categoryList) {
										%><option value="<%=category.getCategoryId()%>"><%=category.getCategoryName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Type</td>
								<td><input type="radio" name="isChargeable" /> paid <input
									type="radio" name="isChargeable" /> free</td>
							</tr>
							<tr>
								<td class="bold" width="10%">Fee</td>
								<td><input name="fee" /></td>
							</tr>
							<tr>
								<td class="bold">Organized By</td>
								<td><input name="organizedBy" id="organizedBy" /></td>
							</tr>
							<tr>
								<td class="bold">Contact Person</td>
								<td><input name="contactPerson" id="contactPerson" /></td>
							</tr>
							<tr>
								<td class="bold">Phone</td>
								<td><input name="phoneNo" id="phoneNo" /></td>
							</tr>
							<tr>
								<td class="bold">Fax</td>
								<td><input name="faxNo" id="faxNo" /></td>
							</tr>
							<tr>
								<td class="bold">Mobile</td>
								<td><input name="mobileNo" id="mobileNo" /></td>
							</tr>
							<tr>
								<td class="bold">Website</td>
								<td><input name="website" id="website" /></td>
							</tr>
							<tr>
								<td class="bold">Email</td>
								<td><input name="emailId" id="emailId" /></td>
							</tr>
							<tr>
								<td class="bold">Terms & Conditions</td>
								<td><textarea rows="5" cols="25" name="termsConditions"
										id="termsConditions"></textarea></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add"> <input
									type="reset"></td>
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