<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Jobs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

<%@ include file="../common/navbar.jsp" %>

<h2>Available Job Listings</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Location</th>
        <th>Action</th>
    </tr>
    <c:forEach var="job" items="${jobs}">
        <tr>
            <td>${job.title}</td>
            <td>${job.description}</td>
            <td>${job.location}</td>
            <td>
                <a href="${pageContext.request.contextPath}/user/apply-job/${job.id}">Apply</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
