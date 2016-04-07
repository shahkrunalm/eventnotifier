<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View User Profile - Curated Event Notifier</title>
</head>
<%
	User userProfile = (User) request.getAttribute("userProfile");
%>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View User Profile</h4></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td width="20%" class="bold">User Id</td>
							<td><%=userProfile.getId()%></td>
						</tr>
						<tr>
							<td width="20%" class="bold">Username</td>
							<td><%=userProfile.getUsername()%></td>
						</tr>

						<tr>
							<td class="bold">Email</td>
							<td>
								<%
									if (userProfile.getEmail() == "")
										out.print("-");
									else
										out.print(userProfile.getEmail());
								%>
							</td>
						</tr>

						<tr>
							<td class="bold">Name</td>
							<td><%=userProfile.getFirstname()%> <%=userProfile.getLastname()%></td>
						</tr>

						<tr>
							<td class="bold">Gender</td>
							<td><%=userProfile.getGender()%></td>
						</tr>
						<tr>
							<td class="bold">Birth Date</td>
							<td><%=DateUtil.getOnlyDate(userProfile.getBirthDate())%></td>
						</tr>
						<tr>
							<td class="bold">Interested Category</td>
							<td><%=userProfile.getCategory().getCategoryName()%></td>
						</tr>
						<tr>
							<td class="bold">Education</td>
							<td><%=userProfile.getEducation()%></td>
						</tr>

						<tr>
							<td class="bold">Occupation</td>
							<td><%=userProfile.getOccupation()%></td>
						</tr>
						<tr>
							<td class="bold">Address</td>
							<td><%=userProfile.getAddress()%></td>
						</tr>
						<tr>
							<td class="bold">City</td>
							<td><%=userProfile.getCity().getCityName()%></td>
						</tr>

						<tr>
							<td class="bold">Pincode</td>
							<td><%=userProfile.getPincode()%></td>
						</tr>
						<tr>
							<td class="bold">State</td>
							<td><%=userProfile.getState().getStateName()%></td>
						</tr>
						<tr>
							<td class="bold">Mobile no.</td>
							<td><%=userProfile.getMobile()%></td>
						</tr>
						<tr>
							<td class="bold">Last Login</td>
							<td>
								<%
									if (userProfile.getLastLogin() != null) {
										out.print(DateUtil.getFormattedDate(userProfile.getLastLogin()));
									}else{
										out.print("N.A.");
									}
								%>
							</td>
						</tr>
						<tr>
							<td class="bold">Member since</td>
							<td><%=DateUtil.getOnlyDate(userProfile.getMemberSince())%></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>