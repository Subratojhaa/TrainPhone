<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Availability Results</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

   
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Available Trains</h1>

        <c:if test="${not empty availableTrains}">
            <table class="table table-bordered table-striped">
                <thead class="thead-dark">
                    <tr>
                        <th>Train Number</th>
                        <th>Source Station</th>
                        <th>Destination Station</th>
                        <th>Available Seats</th>
                        <th>Travel Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="train" items="${availableTrains}">
                        <tr>
                            <td>${train.trainNumber}</td>
                            <td>${train.sourceStation}</td>
                            <td>${train.destinationStation}</td>
                            <td>${train.availableSeats}</td>
                            <td>${train.travelDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty availableTrains}">
            <div class="alert alert-warning" role="alert">
                No trains available for the selected route and date.
            </div>
        </c:if>

        <div class="text-center">
            <a href="/Project5" class="btn btn-primary">Go to Home Page</a>
        </div>
    </div>
</body>
</html>
