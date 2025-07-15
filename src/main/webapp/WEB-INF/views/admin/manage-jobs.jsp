<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head><title>Manage Jobs</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Posted Jobs</h2>
<table border="1">
<tr><th>Title</th><th>Location</th><th>Action</th></tr>
<c:forEach var="job" items="${jobs}">
<tr><td>${job.title}</td><td>${job.location}</td>
<td><a href="${pageContext.request.contextPath}/admin/delete-job/${job.id}">Delete</a></td>
</tr>
</c:forEach>
</table>
</body></html>