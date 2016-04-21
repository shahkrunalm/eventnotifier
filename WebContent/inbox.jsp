<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inbox | Event Notifier</title>

<%
	List<Message> messageList = (List<Message>) request.getAttribute("messageList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Inbox</td>
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
		<table border="1" width="100%" id="table-with-padding">
			<%
				if(messageList.size()==0){
			%>
			<tr>
				<td>No message available.</td>
			</tr>
			<%
				}else{
			%>
			<tr>
				<td class="bold" align="center">Sr. No.</td>
				<td class="bold">From</td>
				<td class="bold">Subject</td>
				<td class="bold" align="center">Date</td>
				<td class="bold" align="center">Status</td>
				<td class="bold" align="center">Delete</td>
			</tr>
			<%
				int i = 0;
																																				for(Message message : messageList){
			%>
			<tr>
				<td align="center" width="7%"><%=++i%></td>
				<td width="23%"><%=message.getMessageFrom()%></td>
				<td width="35%"><a
					href='<%=request.getContextPath() + "/MessageController?action=view&id="%>
								<%=message.getMessageId()%>'
					title="click here to view message"><%=message.getSubject()%></a></td>
				<td align="center" width="25%"><%=DateUtil.getFormattedDate(message.getMessageOn())%></td>
				<td align="center" width="5%">
					<%
						if(message.getReadStatus()==0) {
					%> <img alt="message" src="images/email.png"> <%
 	}else if(message.getReadStatus()==1) {
 %> <img alt="message" src="images/email_open.png"> <%
 	}
 %>
				</td>
				<td align="center" width="5%"><a
					href="javascript:deleteMessage(<%=message.getMessageId()%>)"
					title="click here to delete this message"><img alt="delete"
						src="images/delete.png"></a></td>
			</tr>
			<%
				}
																																			}
			%>
		</table>
		<form action='<%=request.getContextPath()%>/MessageController'
			id="deleteMessageForm" name="deleteMessageForm" method="post">
			<input name="messageId" type="hidden" id="messageId" /> <input
				name="action" type="hidden" value="delete_from" />
		</form>
		<hr>
	</div>
	<script type="text/javascript">
		function deleteMessage(id) {
			var cnfm = false;
			cnfm = confirm("You are going to delete this message, are you sure ?");
			if (cnfm) {
				document.getElementById("messageId").value = id;
				document.getElementById("deleteMessageForm").submit();
			}
		}
	</script>
	<%@ include file="footer-files.jsp"%>
</body>
</html>