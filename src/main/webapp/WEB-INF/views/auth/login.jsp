<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head><title>Login</title>
<link rel="stylesheet" href="/css/style.css" /></head>
<body>
<%@ include file="../common/navbar.jsp" %>
<h2>Login</h2>
<form action="/login" method="post">
    <input type="email" name="email" placeholder="Email" required /><br><br>
    <input type="password" name="password" placeholder="Password" required /><br><br>
    <button type="submit">Login</button>
</form>
<p>New user? <a href="/signup">Signup here</a></p>
<c:if test="${not empty sessionScope.msg}">
    <p style="color:red;">${sessionScope.msg}</p>
</c:if>
</body></html>