<%--
  Created by IntelliJ IDEA.
  User: sergiomuniz
  Date: 4/20/21
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Delete ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp"/>
<div class="container">
    <form action="/delete/${ad.id}" method="POST">
        <div class="container">
            <h1 class="title">${ad.title}</h1>
            <div class="text">${ad.description}</div>
            <input type="submit" class="btn btn-info btn-primary" value="Delete">
            <a href="/update/${ad.id}"><button class="btn btn-info btn-primary" type="button">Update</button></a>
        </div>
    </form>
</div>
</body>
</html>
