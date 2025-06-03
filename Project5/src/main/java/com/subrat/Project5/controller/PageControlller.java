package com.subrat.Project5.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import com.subrat.Project5.model.Ticket;
import com.subrat.Project5.model.Train;
import com.subrat.Project5.service.SmsService;
import com.subrat.Project5.service.TicketService;
import com.subrat.Project5.service.TrainService;


@Controller
public class PageControlller {

    @Autowired
    private TicketService ticketService;
    
   @Autowired
   private TrainService trainService;
    
   @Autowired
   SmsService smsService;
   
    @GetMapping("/")
    public String home() {
        return "home"; 
        
    }

    /* Book Ticket Logics  */
    //------------------------//
    
    @GetMapping("/bookTicketForm")
    public String showBookTicketForm() {
        return "bookTicketForm"; 
    }

    @PostMapping("/bookTicketForm")
    public String bookTicket(@RequestParam String fromStation,
                             @RequestParam String toStation,
                             @RequestParam String passengerName,
                             @RequestParam int noOfTickets,
                             @RequestParam String travelDate,
                             Model model, HttpSession session) {
    	 try {
    	        Ticket ticket = ticketService.bookTicket(fromStation, toStation, passengerName, noOfTickets, travelDate);
    	      
    	        model.addAttribute("ticket", ticket);
    	        session.setAttribute("ticket", ticket);
    	        String smsBody = "Hi " + passengerName + ", your ticket from " + fromStation + " to " + toStation +
    	                 " on " + travelDate + " has been booked. Ref: " + ticket.getBookingReferenceNumber();

    	smsService.sendSMS("+919381703589", smsBody); // Replace with actual user number


    	        return "ticketConfirmation"; 
    	        
    	    } catch (IllegalStateException e) {
    	        model.addAttribute("errorMessage", e.getMessage()); 
    	        return "bookTicketForm"; 
    	    }
    }
    
    
    /* Ticket Confirmation Logics  */
    //------------------------//
    
    @GetMapping("/ticketConfirmation")
    public String showTicketConfirmation() {
    	
    	
        return "ticketConfirmation";  
    }
    
    
    /* Check Train availability Logics  */
    //------------------------//
    
    @GetMapping("/checkAvailability")
    public String showCheckAvailabilityForm() {
        return "checkAvailability"; 
    }

    
    @PostMapping("/checkAvailability")
    public String checkTrainAvailabilityy(@RequestParam String sourceStation,
                                         @RequestParam String destinationStation,
                                         @RequestParam String travelDate,
                                         Model model) {
    	
       
        List<Train> availableTrains = trainService.checkTrainAvailability(sourceStation, destinationStation, travelDate);
     
        
        model.addAttribute("availableTrains", availableTrains);
        return "availabilityResult"; 
    }
    
    
    /* View Ticket  Logics  */
    //------------------------//
    
    @PostMapping("/checkTicket")
    public String viewTicket(@RequestParam String bookingReferenceNumber, Model model) {
        
        Ticket ticket = ticketService.getTicketByReferenceNumber(bookingReferenceNumber);

        if (ticket != null) {
            
            model.addAttribute("ticket", ticket);
        } else {
           
            model.addAttribute("message", "Ticket not found.");
        }

        return "viewTicket";  
    }
    
    @GetMapping("/viewTicket")
    public String checkTick() {
    	return "viewTicket";
    }
    
    //Cancel Ticket
    
    @GetMapping("/cancelTickets")
    public String cancelUserTicket() {
    	return "cancelTicket";
    }
    
    @PostMapping("/cancelTickets")
    public String cancelUserTicketForm(@RequestParam String bookingReferenceNumber, Model model,HttpSession session) {
    	
    	String msg=ticketService.removeTicketByBookingReferenceNumber(bookingReferenceNumber);
    	
    	
        session.removeAttribute("ticket");
   
    	
      model.addAttribute("cancelMsg", msg);
    	
    	
    	return "cancelTicket";
    }

    


    @GetMapping("/downloadTicket")
    public void downloadTicket(HttpServletResponse response, HttpSession session) throws Exception {
       
        Ticket ticket = (Ticket) session.getAttribute("ticket");
      
       

        // Set response properties
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename="+ticket.getPassengerName()+"-"+System.currentTimeMillis()+".pdf");

      
        Document document = new Document();
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        document.add(new Paragraph("                Ticket Confirmed",new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, BaseColor.BLUE)));
        document.add(new Paragraph("---------------------------------------------------------------------------"));
        document.add(new Paragraph("BookingReferenceNumber: "+ticket.getBookingReferenceNumber()));
        document.add(new Paragraph("Passenger: " + ticket.getPassengerName()));
        document.add(new Paragraph("From: " + ticket.getFromStation()));
        document.add(new Paragraph("To: " + ticket.getToStation()));
        document.add(new Paragraph("Date: " + ticket.getTravelDate()));
        document.add(new Paragraph("Tickets: "+ticket.getNoOfTickets()));
        document.add(new Paragraph("---------------------------------------------------------------------------"));
        
        document.add(new Paragraph("                                Have a Safe journey"));
        document.close();
    }
    
    
    @GetMapping("/livestatus")
    public String getStatus() {
    	return "liveStatus";
    }

  


}
