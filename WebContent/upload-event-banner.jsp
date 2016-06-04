<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Event Banner | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<div class="container wow fadeInDown">
		<table width="100%" id="table-page-heading">
			<tr>
				<td>Upload Event Banner</td>
			</tr>
		</table>
		<form action="./EventBannerController" method="post"
			name="upload-event-banner-form" id="upload-event-banner-form"
			 enctype="multipart/form-data">
			<table border="0" width="100%" id="table-with-padding">
				<tr>
					<td class="bold" width="12%"></td>
					<td><input type="hidden" name="id"
						value="<%=request.getParameter("id")%>" /></td>
				</tr>
				<tr>
					<td class="bold">Event Banner</td>
					<td><input id="fileName" type="file" name="fileName" size="30" /></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Upload" /></td>
				</tr>
			</table>
		</form>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>