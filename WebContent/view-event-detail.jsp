<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Event Detail | Event Notifier</title>
<%
	Event event = (Event) request.getAttribute("event");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View Event Details</td>
			</tr>
		</table>
		<%
			if (user == null) {
				response.sendRedirect(request.getContextPath()
						+ "/login.jsp?code=3");
			}
			if (user != null && user.getType() == 1 && event != null) {
				if (event.getStatus() == 0) {
		%>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td>

					<div id="status">
						<a href="javascript:changeEventStatus(<%=event.getId()%>,2)"
							title="click here to reject event"><img alt="reject it"
							src="images/reject.png" title="click here to reject event"
							height="28" width="28" /></a><a
							href="javascript:changeEventStatus(<%=event.getId()%>,1)"
							title="click here to approve event"><img alt="reject it"
							src="images/approve.png" title="click here to approve event"
							height="28" width="28"></a>
					</div>
				</td>
			</tr>
		</table>
		<%
			}
			}
		%>
		<%
			if (event != null && user != null
					&& event.getUser().getUsername().equals(user.getUsername())
					|| user != null && user.getType() == 1) {
		%>
		<table border="0" width="100%" id="table-with-padding">
			<tr>
				<td class="bold" width="20%">Status</td>
				<td>
					<%
						if (event.getStatus() == 0) {
					%> <span class="red">Pending</span> <%
 	} else if (event.getStatus() == 1) {
 %> <span class="green">Approved</span> <%
 	} else if (event.getStatus() == 2) {
 %> <span class="red">Rejected</span> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td class="bold">Verified By</td>
				<td>
					<%
						if (event.getVerifyBy() == null) {
					%><span class="red">not verified yet</span> <%
 	} else {
 %><span class="green"><%=event.getVerifyBy()%></span> <%
 	}
 %>
				</td>
			<tr>
				<td class="bold">Verified On</td>
				<td>
					<%
						if (event.getVerifyOn() == null) {
					%><span class="red">not verified yet</span> <%
 	} else {
 %><span class="green"><%=DateUtil.getOnlyDate(event.getVerifyOn())%></span>
					<%
						}
					%>
				</td>
			</tr>
			<%
				if (event.getApprovedBy() != null
							&& event.getApprovedOn() != null) {
			%>
			<tr>
				<td class="bold">Approved By</td>
				<td><span class="green"><%=event.getApprovedBy()%></span></td>
			</tr>
			<tr>
				<td class="bold">Approved On</td>
				<td><span class="green"><%=DateUtil.getOnlyDate(event.getApprovedOn())%></span>
				</td>
			</tr>
			<%
				}
			%>
			<%
				if (event.getRejectedBy() != null
							&& event.getRejectedOn() != null) {
			%>
			<tr>
				<td class="bold">Rejected By</td>
				<td><span class="red"><%=event.getRejectedBy()%></span></td>
			</tr>
			<tr>
				<td class="bold">Rejected On</td>
				<td><span class="red"><%=DateUtil.getOnlyDate(event.getRejectedOn())%></span>
				</td>
			</tr>
			<%
				}
			%>

		</table>
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td></td>
			</tr>
		</table>
		<%
			}
		%>

		<table border="0" width="100%" id="table-with-padding">
			<%
				if (event == null) {
			%>
			<tr>
				<td>Event details are unavailable, please try after sometime.</td>
			</tr>
			<%
				} else {
			%>
			<tr>
				<td class="bold" width="20%">Event Name</td>
				<td><%=event.getEventName()%></td>
			</tr>
			<tr>
				<td class="bold">Start Date & Time</td>
				<td><%=DateUtil.getOnlyDate(event.getStartDate()) + " "
						+ event.getStartTime()%></td>
			</tr>
			<tr>
				<td class="bold">End Date & Time</td>
				<td><%=DateUtil.getOnlyDate(event.getEndDate()) + " "
						+ event.getEndTime()%></td>
			</tr>
			<tr>
				<td class="bold">Address</td>
				<td><%=event.getAddress()%></td>
			</tr>
			<tr>
				<td class="bold">Landmark</td>
				<td><%=event.getLandmark()%></td>
			</tr>
			<tr>
				<td class="bold">State</td>
				<td><%=event.getState().getStateName()%></td>
			</tr>
			<tr>
				<td class="bold">City</td>
				<td><%=event.getCity().getCityName()%></td>
			</tr>
			<tr>
				<td class="bold">Pincode</td>
				<td><%=event.getPincode()%></td>
			</tr>
			<tr>
				<td class="bold">Phone</td>
				<td><%=event.getPhoneNo()%></td>
			</tr>
			<tr>
				<td class="bold">Fax No</td>
				<td><%=event.getFaxNo()%></td>
			</tr>
			<tr>
				<td class="bold">Mobile</td>
				<td><%=event.getMobileNo()%></td>
			</tr>
			<tr>
				<td class="bold">Contact Person</td>
				<td><%=event.getContactPerson()%></td>
			</tr>
			<tr>
				<td class="bold">Website</td>
				<td><%=event.getWebsite()%></td>
			</tr>
			<tr>
				<td class="bold">Email</td>
				<td><%=event.getEmailId()%></td>
			</tr>
			<tr>
				<td class="bold">Terms & conditions</td>
				<td><%=event.getTermsConditions()%></td>
			</tr>

			<%
				}
			%>

		</table>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>

</body>
<script type="text/javascript">
	function changeEventStatus(id, status) {
		var cnfm = false;
		if (status == 2) {
			cnfm = confirm("You are going to reject this event id " + id
					+ ", are you sure ?");
		} else if (status == 1) {
			cnfm = confirm("You are going to approve this event id " + id
					+ ", are you sure ?");
		}
		if (cnfm) {
			$.ajax({
				url : "/eventnotifier/EventController?action=change-status&id="
						+ id + "&status=" + status,
				success : function(result) {
					alert(result);
					$("#status").html(result);
				}
			});
		}
	}
</script>
</html>