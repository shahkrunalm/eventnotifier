<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View User Profile - Curated Event Notifier</title>
<%
	User userProfile = (User) request.getAttribute("userProfile");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View User Profile</td>
			</tr>
		</table>
		<table border="0" width="100%" id="table-with-padding">
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
						} else {
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
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>