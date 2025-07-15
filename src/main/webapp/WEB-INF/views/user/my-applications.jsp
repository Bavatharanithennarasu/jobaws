<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head><title>My Applications</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>My Applications</h2>
<table border="1">
<tr><th>Job Title</th></tr>
<c:forEach var="app" items="${applications}">
<tr><td>${app.job.title}</td></tr>
</c:forEach>
</table>
</body></html>
