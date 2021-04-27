<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <style>
        body {
            color: white;

        }
        #bg {
            position: fixed;
            z-index: -1;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
        }
        #food {
            height: 100%;
            width: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        #center {
            margin-top: 125px;

        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />
<div id="bg">
<img src="../img/food.jpg" id="food" alt="food">
</div>


<div id="center">
<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
</div>

<div class="container">
    <a href="ads/create"><button class="btn btn-primary btn-block">Create a new ad</button></a>
    <br>
    <a href="ads"><button class="btn btn-primary btn-block">View all ads</button></a>

    <h1>Here are all the ads you posted!</h1>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <form>
                <h2>${ad.dish_name}</h2>
                <h4>${ad.ingredients}</h4>
                <h4>${ad.diet_type}</h4>
                <h4>${ad.caloric_content}</h4>
                <p>${ad.description}</p>

                <a href="<c:url value="ads/edit" >
    <c:param name="id" value="${ad.id}"/>
    </c:url>">Edit</a>
                <a href="<c:url value="ads/delete" >
    <c:param name="id" value="${ad.id}"/>
    </c:url>">Delete</a>
            </form>
        </div>
    </c:forEach>
</div>
</div>
</body>
<footer>
    <div class="container">
        <a href="/updateProfile/${user.id}"><button class="btn btn-primary btn-block">Edit Profile</button></a>
        <br>

    </div>




</footer>
</html>