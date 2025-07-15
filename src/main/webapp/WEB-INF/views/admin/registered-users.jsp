<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head><title>Registered Users</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Applied Users</h2>
<table border="1">
<tr><th>Email</th><th>Job</th><th>Date</th></tr>
<c:forEach var="app" items="${applications}">
<tr><td>${app.user.email}</td><td>${app.job.title}</td><td>${app.appliedDate}</td></tr>
</c:forEach>
</table>
</body></html>