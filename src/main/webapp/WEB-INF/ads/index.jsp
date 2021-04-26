<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h3>Ad: ${ad.dish_name}</h3>
            <h4>Posted by: ${usersDao.findById(ad.userId).getUsername()}</h4>
                <%--            undefined method (getPhoneNumber) --%>
                <%--            <h4>Contact number: ${usersDao.findById(ad.userId).getPhoneNumber()}</h4>--%>
            <h4>Ingredients: ${ad.ingredients}</h4>
            <h4>Diet: ${ad.diet_type}</h4>
            <h4>Calories: ${ad.caloric_content}</h4>
            <p>Description: ${ad.description}</p>
        </div>
    </c:forEach>
</div>
<div class="container">
    <br>
    <a href="../profile"><button class="btn btn-primary btn-block">Back to my profile</button></a>
</div>
</body>
</html>