<%@page import="com.eventnotifier.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Event Detail - Curated Event Notifier</title>
<%@ include file="header.jsp"%>

<%
	Event event = (Event) request.getAttribute("event");
%>
<%@ include file="menu.jsp"%>
</head>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Event Detail</h4></td>
						</tr>
					</table>
					<%
						if (user != null && user.getType() == 1 && event != null) {
					%>
					<table border="0">
						<tr>
							<td>
								<%
									if (event.getStatus() == 0) {
								%>
								<div id="status">
									<a href="javascript:changeEventStatus(<%=event.getId()%>,-1)"
										title="click here to reject event"><img alt="reject it"
										src="images/reject.png" title="click here to reject event"
										height="28" width="28" /></a><a
										href="javascript:changeEventStatus(<%=event.getId()%>,1)"
										title="click here to approve event"><img alt="reject it"
										src="images/approve.png" title="click here to approve event"
										height="28" width="28"></a>
								</div> <%
 	}
 	}
 %>
							</td>
						</tr>
					</table>
					<%
						if (event != null && user != null
								&& event.getCreatedBy().equals(user.getUsername())
								|| user != null && user.getType() == 1) {
					%>
					<table border="0" width="100%" id="table-5">
						<tr>
							<td class="bold" width="20%">Status</td>
							<td>
								<%
									if (event.getStatus() == 0) {
								%> <span class="boldred">Pending</span> <%
 	} else if (event.getStatus() == 1) {
 %> <span class="boldgreen">Approved</span> <%
 	} else if (event.getStatus() == 2) {
 %> <span class="boldred">Rejected</span> <%
 	}
 %>
							</td>
						</tr>
						<tr>
							<td class="bold">Verified By</td>
							<td>
								<%
									if (event.getVerifyBy() == null) {
								%><span class="boldred">not verified yet</span> <%
 	} else {
 %><span class="boldgreen"><%=event.getVerifyBy()%></span> <%
 	}
 %>
							</td>
						<tr>
							<td class="bold">Verified On</td>
							<td>
								<%
									if (event.getVerifyOn() == null) {
								%><span class="boldred">not verified yet</span> <%
 	} else {
 %><span class="boldgreen"><%=DateUtil.getOnlyDate(event.getVerifyOn())%></span>
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
							<td><span class="boldgreen"><%=event.getApprovedBy()%></span>
							</td>
						</tr>
						<tr>
							<td class="bold">Approved On</td>
							<td><span class="boldgreen"><%=DateUtil.getOnlyDate(event.getApprovedOn())%></span>
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
							<td><span class="boldred"><%=event.getRejectedBy()%></span></td>
						</tr>
						<tr>
							<td class="bold">Rejected On</td>
							<td><span class="boldred"><%=DateUtil.getOnlyDate(event.getRejectedOn())%></span>
							</td>
						</tr>
						<%
							}
						%>

					</table>
					<%
						}
					%>
					<table border="0" width="100%" id="table-5">
						<%
							if (event == null) {
						%>
						<tr>
							<td>Event details are unavailable, please try after
								sometime.</td>
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
							<td><%=event.getState()%></td>
						</tr>
						<tr>
							<td class="bold">City</td>
							<td><%=event.getCity()%></td>
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
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript">
	function changeEventStatus(id, status) {
		var cnfm = false;
		if (status == -1) {
			cnfm = confirm("You are going to reject this event id " + id
					+ ", are you sure ?");
		} else if (status == 1) {
			cnfm = confirm("You are going to approve this event id " + id
					+ ", are you sure ?");
		} else if (status == 2) {
			cnfm = confirm("You are going to open this event id " + id
					+ ", are you sure ?");
		} else if (status == 3) {
			cnfm = confirm("You are going to close this event id " + id
					+ ", are you sure ?");
		}
		if (cnfm) {
			$.ajax({
				url : "eventnotifier/EventController?action=change-status&id="
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