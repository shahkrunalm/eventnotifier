<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error Page - Curated Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<table border="0" width="100%" id="table-with-padding">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</table>
	<div class="container wow fadeInDown">
		<section id="error" class="container text-center">
		<h1>404, Page not found</h1>
		<p>The Page you are looking for doesn't exist or an other error
			occurred.</p>
		<a class="btn btn-primary" href="index.jsp">GO BACK TO THE
			HOMEPAGE</a> </section>
		<!--/#error-->
		<hr>
	</div>
	<%@ include file="footer-files.jsp"%>
</body>
</html>