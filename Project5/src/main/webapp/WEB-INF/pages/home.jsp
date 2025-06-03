<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Train Ticket Booking</title>

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
.text {
  color: white;
  background: none;
  -webkit-background-clip: unset;
  background-clip: unset;
  font-size: 4rem;
  line-height: 1;
  position: relative;
  display: inline-block;
}

.text span {
  position: absolute;
  inset: 0;
  background-color: #4246ce;
  color: #0D0D0D;
  clip-path: polygon(0 50%, 100% 50%, 100% 50%, 0 50%);
  transition: clip-path 0.4s cubic-bezier(.1,.5,.5,1);
  display: flex;
  justify-content: center;
  align-items: center;
}

.text:hover > span {
  clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
}

.custom-button {
  display: inline-block;
  padding: 8px 16px;
  border: none;
  border-radius: 12px;
  color: white;
  position: relative;
  font-weight: 700;
  font-size: 14px;
  background: #3366FF; /* bright blue */
  box-shadow: 4px 6px 12px -3px rgba(51, 102, 255, 0.6);
  text-decoration: none;
  transition: all 250ms;
  overflow: hidden;
  z-index: 1;
  cursor: pointer;
}

.custom-button::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 0;
  border-radius: 12px;
  background-color: white;
  box-shadow: 4px 6px 12px -3px rgba(0, 0, 0, 0.2);
  transition: all 250ms;
  z-index: -1;
}

.custom-button:hover {
  color: #3366FF; /* text turns blue on hover */
}

.custom-button:hover::before {
  width: 100%;
}


    </style>
    
</head>
<body class="bg-light">

   
    <div class="jumbotron jumbotron-fluid text-white text-center" style="background: linear-gradient(to right, #5d6d7e, #34495e);">
        <div class="container">
       <h1 class="display-4 font-weight-bold text">
  Train Ticket Booking
  <span>Enjoy The Ride</span>
</h1>


            <p class="lead">Book, view, check availability, or cancel tickets with ease!</p>
        </div>
    </div>

  
    <div class="container">
        <div class="row text-center mt-4">
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-light">
                    <div class="card-body">
                        <h5 class="card-title">Book a Ticket</h5>
                        <p class="card-text">Reserve your seat now!</p>
                        <a href="./bookTicketForm" class="custom-button">Book Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-light">
                    <div class="card-body">
                        <h5 class="card-title">View Tickets</h5>
                        <p class="card-text">Check your booked tickets.</p>
                        <a href="./viewTicket" class="custom-button">View Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-light">
                    <div class="card-body">
                        <h5 class="card-title">Check Availability</h5>
                        <p class="card-text">See seat availability.</p>
                        <a href="./checkAvailability" class="custom-button">Check Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-light">
                    <div class="card-body">
                        <h5 class="card-title">Cancel Tickets</h5>
                        <p class="card-text">Cancel your bookings.</p>
                     <a href="./cancelTickets" class="custom-button">Cancel Now</a>

                    </div>
                </div>
            </div>
            
            <div class="col-md-3">
                <div class="card shadow-sm border-0 bg-light">
                    <div class="card-body">
                        <h5 class="card-title">IRCTC</h5>
                        <p class="card-text">See live status.</p>
                     <a href="./livestatus" class="custom-button">See Live</a>

                    </div>
                </div>
            </div>
            
            
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
