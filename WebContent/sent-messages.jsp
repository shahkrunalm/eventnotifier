<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sent Messages - Curated Event Notifier</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<Message> messageList = (List<Message>) request.getAttribute("sentMessageList");
	%>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Sent Messages</h4></td>
						</tr>
					</table>

					<table>
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
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<table border="0" width="100%" id="table-5">
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
				</div>
			</div>
		</div>
		<form action='<%=request.getContextPath()%>/MessageController'
			id="deleteMessageTo" name="deleteMessageTo" method="post">
			<input name="messageId" type="hidden" id="messageId" /> <input
				name="action" type="hidden" value="delete_to" />
		</form>
		<br class="clearfix" />
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
	<%@ include file="footer.jsp"%>
</body>
</html>