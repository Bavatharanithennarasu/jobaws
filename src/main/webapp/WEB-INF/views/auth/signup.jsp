<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><title>Signup</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Signup</h2>
<form action="/signup" method="post">
    <input type="email" name="email" placeholder="Email" required /><br><br>
    <input type="password" name="password" placeholder="Password" required /><br><br>
    <button type="submit">Signup</button>
</form>
<p>Already have an account? <a href="/login">Login here</a></p>
</body></html>