<%@page import="com.eventnotifier.util.DateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.eventnotifier.model.*, java.util.List, com.eventnotifier.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Event Notifier</title>
<%@ include file="corlate-header-files.jsp"%>
</head>
<!--/head-->

<body class="homepage">
	<%@ include file="corlate-header.jsp"%>
	<%@ include file="main-slider.jsp"%>
	<%@ include file="events.jsp"%>
	<%@ include file="recent-events.jsp"%>
	<%@ include file="upcoming-events.jsp"%>
	<%--
	<%@ include file="middle.jsp"%>
	<%@ include file="content.jsp"%>
	--%>
	<%@ include file="our-partners.jsp"%>
	<%@ include file="contact-info.jsp"%>
	<%--
	<%@ include file="bottom.jsp"%>
	 --%>
	<%@ include file="corlate-footer.jsp"%>
	<%@ include file="footer-files.jsp"%>
</body>
</html>