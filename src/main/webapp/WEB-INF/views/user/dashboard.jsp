<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head><title>User Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Welcome ${sessionScope.user.email}</h2>
<h3>Available Jobs</h3>
<table border="1">
<tr><th>Title</th><th>Location</th><th>Action</th></tr>
<c:forEach var="job" items="${jobs}">
<tr><td>${job.title}</td><td>${job.location}</td>
<td><a href="${pageContext.request.contextPath}/user/apply-job/${job.id}">Apply</a>
</td></tr>
</c:forEach>
</table>
</body></html>