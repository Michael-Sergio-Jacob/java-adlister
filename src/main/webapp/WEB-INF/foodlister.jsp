<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("userId");
    String driverName = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String dbName = "adlister_db";
    String userId = "root";
    String password = "codeup";

    try {
        Class.forName(driverName);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Food-lister</title>
</head>
<body>

<header>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container-fluid">
            <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarExample01"
                    aria-controls="navbarExample01"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarExample01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item active">
                        <a class="nav-link" aria-current="page" href="/profile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/createad">Create an Ad</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/aboutus">About Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navbar -->

    <!-- Background image -->
<%--    <div class="p-5 text-center bg-image" style="background-image: url('./img/sdw.jpg');height: 400px;">--%>
        <div class="mask" style="background-color: rgba(0, 0, 0, 0.6);">
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-white">
                    <h1 class="mb-3">Food-Lister</h1>
                    <h4 class="mb-3">Below are ads for all our dishes. Feel Free to explore, add and customize your food lists to meet your nutritional needs. Click on view more to see additional details on our variety of meals.</h4>
                </div>
            </div>
        </div>
<%--    </div>--%>
</header>

<table class="table table-hover" align="center" cellpadding="5" cellspacing="5" border="1">
    <thead>
    <tr class="bg-info">
        <td>Dish Name</td>
        <td>Ingriedients</td>
        <td>Diet Type</td>
        <td>Caloric Content</td>
        <td>Macros</td>
    </tr>
        <%
        try{
            connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
            statement=connection.createStatement();
            String sql ="SELECT * FROM dishes";

            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
    %>
    <tr class="bg-light">

        <td><%=resultSet.getString("Dish_Name")%><br><button type="button" class="btn btn-warning">View More</button></td>
        <td class="d-none"><%=resultSet.getString("Pics") %></td>
        <td><%=resultSet.getString("Ingredients") %></td>
        <td><%=resultSet.getString("Diet_Type") %></td>
        <td><%=resultSet.getString("Caloric_Content") %></td>
        <td><%=resultSet.getString("Description") %></td>
        <td><%=resultSet.getString("Pics") %></td>

    </tr>

        <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>



<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>