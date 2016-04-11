<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<%
	final String code = request.getParameter("code");
	if (code != null && code.equals("1"))
		out.print("something went wrong, please try again...");
%>
</head>
<%
	List<Category> categoryList = (List<Category>) application
	.getAttribute("loadedCategoryList");
	List<State> stateList = (List<State>) application
	.getAttribute("loadedStateList");
%>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#signup-form").validate({
							errorClass : "my-error-class",
							rules : {
								firstname : "required",
								lastname : "required",
								birthDate : "required",
								address : "required",
								cityId : "required",
								stateId : "required",
								categoryId : "required",
								username : {
									required : true,
									minlength : 6
								},
								password : {
									required : true,
									minlength : 6
								},
								reEnterPassword : {
									required : true,
									equalTo : "#password"
								},
								mobile : {
									required : true,
									digits : true,
									minlength : 10,
									maxlength : 10
								},
								email : {
									required : true,
									email : true
								},
								pincode : {
									required : true,
									digits : true,
									minlength : 6,
									maxlength : 6
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
							$("#birthDate").datepicker({
								changeMonth : true,
								changeYear : true,
								dateFormat : "dd-mm-yy",
								minDate : "-780m +0w",
								maxDate : "-144m +0w"
							});
						});
					});
</script>
<form action="./UserController" name="signup-form" id="signup-form"
	method="post" class="form">
	<table border="1" width="100%">
		<tr>
			<td class="bold" width="35%"></td>
			<td><input type="hidden" name="action" value="signup" /></td>
		</tr>
		<tr>
			<td class="bold">User name
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td class="bold">Password</td>
			<td><input type="password" name="password" id="password"></td>
		</tr>
		<tr>
			<td class="bold">Re-type Password</td>
			<td><input type="password" name="reEnterPassword"
				id="reEnterPassword"></td>
		</tr>
		<tr>
			<td class="bold">E-mail</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td class="bold">First name</td>
			<td><input type="text" id="firstname" name="firstname"></td>
		</tr>
		<tr>
			<td class="bold">Last name</td>
			<td><input type="text" name="lastname"></td>
		</tr>
		<tr>
			<td class="bold">Gender</td>
			<td><input type="radio" name="gender" value="male"
				checked="checked"> Male &nbsp;&nbsp;&nbsp;<input
				type="radio" name="gender" value="female"> Female</td>
		</tr>

		<tr>
			<td class="bold">Birth Date</td>
			<td><input type="text" name="birthDate" id="birthDate"></td>
		</tr>
		<tr>
			<td class="bold">Interested Category</td>
			<td><select name="categoryId" id="categoryId">
					<option value="">Select</option>
					<%
						for (Category category : categoryList) {
					%><option value="<%=category.getCategoryId()%>"><%=category.getCategoryName()%></option>
					<%
						}
					%>
			</select></td>
		</tr>
		<tr>
			<td class="bold">Education</td>
			<td><select name="education">
					<option value="Graduate">Graduate</option>
					<option value="Post Graduate">Post Graduate</option>
					<option value="Phd">Phd</option>
					<option value="Other">Other</option>
			</select></td>
		</tr>
		<tr>
			<td class="bold">Occupation</td>
			<td><select name="occupation">
					<option value="Business Man">Business Man</option>
					<option value="Other">Other</option>
			</select></td>
		</tr>
		<tr>
			<td class="bold">Address</td>
			<td><input type="text" name="address"></td>
		</tr>

		<tr>
			<td class="bold">State</td>
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
			<td class="bold">City</td>
			<td><select id="cityId" name="cityId">
					<option>Select</option>
			</select></td>
		</tr>

		<tr>
			<td class="bold">Pincode</td>
			<td><input type="text" name="pincode"></td>
		</tr>

		<tr>
			<td class="bold">Mobile no</td>
			<td><input type="text" name="mobile"></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" name="sign up" value="Sign up">
				<input type="reset"></td>
		</tr>
	</table>
</form>
