package com.subrat.Project5.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.subrat.Project5.model.Ticket;
import com.subrat.Project5.model.Train;

@Repository
public interface TicketRepository extends JpaRepository<Ticket, String> {

    
    Ticket findByBookingReferenceNumber(String bookingReferenceNumber);
    
    
    List<Ticket> findByFromStationAndToStationAndTravelDate(String fromStation, String toStation, String travelDate);
    
    
    
}