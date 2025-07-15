<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><title>Apply Job</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Apply for Job</h2>
<p><strong>Title:</strong> ${job.title}</p>
<p><strong>Description:</strong> ${job.description}</p>
<p><strong>Location:</strong> ${job.location}</p>
<form action="/user/apply-job/${job.id}" method="post">
    <button type="submit">Apply Now</button>
</form>
<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>
</body></html>