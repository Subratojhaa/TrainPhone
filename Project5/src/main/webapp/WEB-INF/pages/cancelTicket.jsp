<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cancel Ticket</title>

   <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    

</head>
<body>

<div class="container mt-5">
   <h1 class="text-center mb-4"> Cancel Ticket</h1>
<form action="${pageContext.request.contextPath}/cancelTickets" method="POST" class="form-inline justify-content-center mb-4">

  <div class="form-group">
  
<label for="bookingReferenceNumber"  class="mr-2">Enter BookingRefernceNumber</label>
<input type="text" id="bookingReferenceNumber" name="bookingReferenceNumber" class="form-control" required>
 </div>
<button type="submit"  class="btn btn-primary ml-2">Submit</button>
  </form>
  

<div  class="alert alert-danger" role="alert">
  <strong>${cancelMsg} </strong>
  </div>
 

 <div class="text-center mt-4">
            <a href="/Project5" class="btn btn-secondary">Go to Home Page</a>
        </div>
    </div>
</body>
</html>