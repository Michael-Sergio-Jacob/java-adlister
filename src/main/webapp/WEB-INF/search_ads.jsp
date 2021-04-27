<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
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
    <h1>What is the ad you are searching for?</h1>
    <form action="/search_ads" method="POST">
        <div class="form-group">
            <label for="searched_ads">search</label>
            <input id="searched_ads" name="searched_ads" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Find ads">
    </form>
</div>
</div>
</body>
</html>