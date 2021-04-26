<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Edit ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/loginNavbar.jsp" />
<div class="container">
    <h1>Edit your ad!</h1>
    <form action="/ads/edit" method="post">
        <div class="form-group">
            <label for="dish_name">Name</label>
            <input id="dish_name" name="dish_name" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="ingredients">Ingredients</label>
            <input id="ingredients" name="ingredients" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="diet_type">Diet</label>
            <input id="diet_type" name="diet_type" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="caloric_content">Calories</label>
            <input id="caloric_content" name="caloric_content" class="form-control" type="number">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <input id="description" name="description" class="form-control" type="text">
        </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
