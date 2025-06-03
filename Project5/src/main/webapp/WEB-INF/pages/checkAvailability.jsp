<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Availability</title>

  
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Check Train Availability</h1>
        
        <form action="${pageContext.request.contextPath}/checkAvailability" method="POST">
            <div class="form-group">
                <label for="sourceStation">Source Station:</label>
                <input type="text" id="sourceStation" name="sourceStation" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="destinationStation">Destination Station:</label>
                <input type="text" id="destinationStation" name="destinationStation" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="travelDate">Travel Date (YYYY-MM-DD):</label>
                <input type="text" id="travelDate" name="travelDate" class="form-control" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Check Availability</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
