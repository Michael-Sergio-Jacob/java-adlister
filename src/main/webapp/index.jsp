<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome!" />
    </jsp:include>
    <style>
        body
        {
            text-align:center;
            width:100%;
            margin:0 auto;
            padding:0px;

        }
        #video_wrapper
        {
            margin:0px;
            padding:0px;
        }
        #video_wrapper video
        {
            position: fixed;
            top: 50%; left: 50%;
            z-index: 1;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            transform: translate(-50%, -50%);
        }
        #video_wrapper
        {

            position: fixed;
            z-index: -1;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            filter: brightness(75%);
        }
       .container {
           margin-top: 150px;
           height: 400px;
           width: 800px;
           display: flex;
           flex-direction: column;
           justify-content: center;
           text-align: center;
           color: white;
       }



    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the Foodlister!</h1>
    </div>
    <div id="video_wrapper">
        <video autoplay muted loop>
            <source src="img/foodlister_main.mp4" type="video/mp4">
        </video>
    </div>

</body>
</html>
