<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><title>Admin Dashboard</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Admin Dashboard</h2>
<p>Welcome, ${sessionScope.user.email}!</p>
</body></html>