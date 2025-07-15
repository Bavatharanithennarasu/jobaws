<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><title>Post Job</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Post New Job</h2>
<form action="/admin/save-job" method="post">
    <input type="text" name="title" placeholder="Title" required /><br><br>
    <textarea name="description" placeholder="Description" required></textarea><br><br>
    <input type="text" name="location" placeholder="Location" required /><br><br>
    <button type="submit">Save</button>
</form>
</body></html>