<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Ticket</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/viewTicket.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">View Ticket</h1>

        <!-- Form to enter the booking reference number -->
        <form action="${pageContext.request.contextPath}/checkTicket" method="POST" class="form-inline justify-content-center mb-4">
            <div class="form-group">
                <label for="bookingReferenceNumber" class="mr-2">Enter Booking Reference Number:</label>
                <input type="text" id="bookingReferenceNumber" name="bookingReferenceNumber" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary ml-2">Check Ticket</button>
        </form>

        <c:if test="${not empty message}">
            <div class="alert alert-danger" role="alert">
                <strong>${message}</strong>
            </div>
        </c:if>

        <c:if test="${not empty ticket}">
            <h2 class="mt-4">Ticket Details</h2>
            <div class="card">
                <div class="card-body">
                    <p><strong>Booking Reference Number:</strong> ${ticket.bookingReferenceNumber}</p>
                    <p><strong>From Station:</strong> ${ticket.fromStation}</p>
                    <p><strong>To Station:</strong> ${ticket.toStation}</p>
                    <p><strong>Passenger Name:</strong> ${ticket.passengerName}</p>
                    <p><strong>Number of Tickets:</strong> ${ticket.noOfTickets}</p>
                    <p><strong>Travel Date:</strong> ${ticket.travelDate}</p>
                </div>
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="./" class="btn btn-secondary">Go to Home Page</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
