<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar">
    <a href="/">Home</a>
    <c:choose>
        <c:when test="${sessionScope.user == null}">
            <a href="/login">Login</a>
            <a href="/signup">Signup</a>
        </c:when>
        <c:otherwise>
            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                <a href="/admin/post-job">Post Job</a>
                <a href="/admin/manage-jobs">Manage Jobs</a>
                <a href="/admin/registered-users">Registered Users</a>
                <a href="/logout">Logout (${sessionScope.user.email})</a>
            </c:if>
            <c:if test="${sessionScope.user.role == 'USER'}">
                <a href="/user/dashboard">Dashboard</a>
               <a href="${pageContext.request.contextPath}/user/available-jobs">Available Jobs</a>
<a href="${pageContext.request.contextPath}/user/my-applications">My Applications</a>
               
             
              
               
                <a href="/logout">Logout (${sessionScope.user.email})</a>
            </c:if>
        </c:otherwise>
    </c:choose>
</div>

