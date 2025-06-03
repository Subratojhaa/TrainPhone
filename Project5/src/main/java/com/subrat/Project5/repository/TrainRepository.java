package com.subrat.Project5.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.subrat.Project5.model.Train;

@Repository
public interface TrainRepository extends JpaRepository<Train, String> {
    
  
    List<Train> findBySourceStationAndDestinationStationAndTravelDate(
            String sourceStation, String destinationStation, String travelDate);
}