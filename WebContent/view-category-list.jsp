<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Category List - Curated Event Notifier</title>
<%
	List<Category> categoryList = (List<Category>) request
			.getAttribute("categoryList");
%>
<%@ include file="corlate-header-files.jsp"%>

</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container">
		<table border="0" width="100%" id="table-page-heading">
			<tr>
				<td>View Category List</td>
			</tr>
		</table>
		<table id="table-with-padding">
			<tr>
				<td><a href="add-category.jsp"
					title="click here to add category">add</a> | <a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=1"%>'
					title="click here to view active category list">active</a> | <a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=0"%>'
					title="click here to view de-active category list">de-active</a> |
					<a
					href='<%=request.getContextPath()
					+ "/CategoryController?action=view-list&status=-1"%>'
					title="click here to view all category list">all</a></td>
			</tr>
		</table>
		<table border="1" width="100%" id="table-with-padding">
			<%
				if (categoryList.size() == 0) {
			%>
			<tr>
				<td>No category available.</td>
			</tr>
			<%
				} else {
			%>
			<tr>
			<tr>
				<td class="bold" align="center" width="10%">Sr. No.</td>
				<td class="bold">Category Name</td>
				<td class="bold" align="center" width="10%">Status</td>
			</tr>
			<%
				int i = 0;
					for (Category category : categoryList) {
			%>
			<tr>
				<td align="center"><%=++i%></td>
				<td><%=category.getCategoryName()%></td>
				<td align="center">
					<%
						if (category.getStatus() == 0) {
					%><span class="red">de-active</span> <%
 	} else {
 %><span class="green">active</span> <%
 	}
 %>
				</td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>