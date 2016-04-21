<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sent Messages | Event Notifier</title>

<%
	List<Message> messageList = (List<Message>) request.getAttribute("sentMessageList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container  wow fadeInDown">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>Sent Messages</td>
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
				<td class="bold" align="left">To</td>
				<td class="bold" align="left">Subject</td>
				<td class="bold" align="center">Date</td>
				<td class="bold" align="left">Delete</td>
			</tr>
			<%
				int i = 0;
																		for(Message message : messageList){
			%>
			<tr>
				<td align="center" width="7%"><%=++i%></td>
				<td align="left" width="23%"><%=message.getMessageTo()%></td>
				<td align="left"><a
					href='<%=request.getContextPath() + "/MessageController?action=view&id="%>
								<%=message.getMessageId()%>'
					title="click here to view message"><%=message.getSubject()%></a></td>
				<td align="center" width="22%"><%=DateUtil.getFormattedDate(message.getMessageOn())%></td>
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
			id="deleteMessageTo" name="deleteMessageTo" method="post">
			<input name="messageId" type="hidden" id="messageId" /> <input
				name="action" type="hidden" value="delete_to" />
		</form>
		<hr>
	</div>
	<script type="text/javascript">
		function deleteMessage(id) {
			var cnfm = false;
			cnfm = confirm("You are going to delete this message, are you sure ?");
			if (cnfm) {
				document.getElementById("messageId").value = id;
				document.getElementById("deleteMessageTo").submit();
			}
		}
	</script>
	<%@ include file="footer-files.jsp"%>
</body>
</html>