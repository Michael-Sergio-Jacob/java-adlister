<%--
  Created by IntelliJ IDEA.
  User: sergiomuniz
  Date: 4/20/21
  Time: 3:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />
<div class="container">
    <h1>What is the ad you are searching for?</h1>
    <form action="/search_ads" method="POST">
        <div class="form-group">
            <label for="searched_ads">search</label>
            <input id="searched_ads" name="searched_ads" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Find ads">
    </form>
</div>
</body>
</html>
