<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing Searchd Ads" />
    </jsp:include>
</head>

<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />
<div class="container">
    <h1>Here Are all the ads!</h1>
    <c:forEach var="ad" items="${searched_ads}">
        <div class="col-md-6">
            <h2>${ad.dish_name}</h2>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>
</body>
</html>