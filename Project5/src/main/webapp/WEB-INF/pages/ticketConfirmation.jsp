<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Confirmation</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ticketConfirmation.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Ticket Booking Confirmation</h1>
        
        <div class="card">
            <div class="card-body">
                <p><strong>Booking Reference Number:</strong> ${ticket.bookingReferenceNumber}</p>
                <p><strong>From Station:</strong> ${ticket.fromStation}</p>
                <p><strong>To Station:</strong> ${ticket.toStation}</p>
                <p><strong>Passenger Name:</strong> ${ticket.passengerName}</p>
                <p><strong>Number of Tickets:</strong> ${ticket.noOfTickets}</p>
                <p><strong>Travel Date:</strong> ${ticket.travelDate}</p>
                
               <div class="text-center mt-4">
    <a href="./" class="btn btn-primary">Go to Home Page</a>
  <a href="${pageContext.request.contextPath}/downloadTicket" class="btn btn-success">Download Ticket PDF</a>

</div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
