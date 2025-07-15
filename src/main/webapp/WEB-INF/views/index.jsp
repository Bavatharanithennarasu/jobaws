<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - EasyHirePro</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
</head>
<body>
<%@ include file="../common/navbar.jsp" %>

<h2>Welcome to EasyHirePro</h2>
<p>Your smart job application system.</p>

<c:if test="${sessionScope.user == null}">
    <p><a href="/login">Login</a> or <a href="/signup">Signup</a> to get started.</p>
</c:if>

<c:if test="${sessionScope.user != null}">
    <p>Visit your <a href="/user/dashboard">Dashboard</a>.</p>
</c:if>

</body>
</html>
