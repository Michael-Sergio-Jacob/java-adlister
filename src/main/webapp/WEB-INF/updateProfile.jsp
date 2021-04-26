<jsp:useBean id="user" scope="request" type="com.codeup.adlister.models.User"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<jsp:include page="partials/loginNavbar.jsp" />
<% String username = request.getParameter("username");
    if (username == null) username = "";
    String email = request.getParameter("email");
    if (email == null) email = "";
%>
<div class="container">
    <h1>Profile information: </h1>
    <%--    Display error message--%>
    <c:if test="${requestScope.listOfErrors.size() > 0}">
        <ul id="errors" class="alert alert-danger">
            <c:forEach var="message" items="${requestScope.listOfErrors}">
                <li><c:out value="${message}"></c:out></li>
            </c:forEach>
        </ul>
    </c:if>
    <form action="/updateUsername" method="post">
        <input type="hidden" name="userId" value="${user.id}">
        <div class="form-group">
            <label for="username">Change Username</label>
            <input id="username" name="username" class="form-control w-75" type="text" value="${user.username}">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Update Username">
    </form>
    <br><br>
    <form action="/updateEmail" method="post">
        <input type="hidden" name="userId" value="${user.id}">
        <div class="form-group">
            <label for="email">Change Email</label>
            <input id="email" name="email" class="form-control" type="text" value="${user.email}" >
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Update Email">
    </form>
    <br><br>
    <form action="/updatePassword" method="post">
        <input type="hidden" name="userId" value="${user.id}">
        <div class="form-group">
            <label for="password">Change Password</label>
            <input id="password" name="password" class="form-control" type="password" aria-required="true" placeholder="enter new password">
        </div>
        <div class="form-group">
            <label for="confirm_password"></label>
            <input id="confirm_password" name="confirm_password" class="form-control" type="password" aria-required="true" placeholder="enter new password again to confirm">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Change Password">
    </form>
</div>
</body>
</html>