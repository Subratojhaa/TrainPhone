package com.subrat.Project5.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subrat.Project5.model.Ticket;
import com.subrat.Project5.model.Train;
import com.subrat.Project5.repository.TicketRepository;
import com.subrat.Project5.repository.TrainRepository;

@Service
public class TicketService {


    @Autowired
    private TicketRepository ticketRepository;

    @Autowired
    private TrainRepository trainRepository;
    
    
    //This method fetch the list of trains from database and confirm the ticket or sends an error msg
    public Ticket bookTicket(String fromStation, String toStation, String passengerName, int noOfTickets, String travelDate) {
       
        List<Train> trains = trainRepository.findBySourceStationAndDestinationStationAndTravelDate(
            fromStation, toStation, travelDate);

        
        Optional<Train> trainOptional = trains.stream()
            .filter(train -> train.getAvailableSeats() >= noOfTickets)
            .findFirst();

        if (trainOptional.isPresent()) {
            Train train = trainOptional.get();
            train.setAvailableSeats(train.getAvailableSeats() - noOfTickets);
            trainRepository.save(train);

            String bookingReferenceNumber = "TICKET-" + System.currentTimeMillis();

            Ticket ticket = new Ticket();
            ticket.setFromStation(fromStation);
            ticket.setToStation(toStation);
            ticket.setPassengerName(passengerName);
            ticket.setNoOfTickets(noOfTickets);
            ticket.setTravelDate(travelDate);
            ticket.setBookingReferenceNumber(bookingReferenceNumber);

            return ticketRepository.save(ticket);
        } else {
            throw new IllegalStateException("No trains available with enough seats for the selected route and date!");
        }
    }

    
   //This method checks the availability of train on basis of date,source station,destination station
    public String checkAvailability(String fromStation, String toStation, String travelDate) {
        
        List<Ticket> tickets = ticketRepository.findByFromStationAndToStationAndTravelDate(fromStation, toStation, travelDate);

        if (tickets.isEmpty()) {
            return "No available tickets for this route on the given date.";
        } else {
            return "Tickets are available for this route.";
        }
    }
    
    
    //logic to fetch the ticket by using generated unique ticket id
    public Ticket getTicketByReferenceNumber(String bookingReferenceNumber) {
        return ticketRepository.findByBookingReferenceNumber(bookingReferenceNumber);
    }
    
    //logic to cancel  a ticket
    public String removeTicketByBookingReferenceNumber(String bookingReferenceNumber) {
    	
    	Ticket ticket=ticketRepository.findByBookingReferenceNumber(bookingReferenceNumber);
    	
    	if(ticket!=null) {
    		ticketRepository.delete(ticket);
    		
    		List<Train> train=trainRepository.findBySourceStationAndDestinationStationAndTravelDate(ticket.getFromStation(), ticket.getToStation(), ticket.getTravelDate());
    		Optional<Train> train2=train.stream().findFirst();
    		Train updateTrain=train2.get();
    		updateTrain.setAvailableSeats(updateTrain.getAvailableSeats()+ticket.getNoOfTickets());
    		trainRepository.save(updateTrain);
    		return ticket.getBookingReferenceNumber()+" cancelled succesfullly";
    	}
		
    	return "No ticket found with this bookingReferenceNumber ";
    	
    	
    	
    	
    	
    }
    
}