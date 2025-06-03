package com.subrat.Project5.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.subrat.Project5.model.Train;
import com.subrat.Project5.repository.TrainRepository;

@Service
public class TrainService {

   @Autowired
   private TrainRepository trainRepository;

	public List<Train> checkTrainAvailability(String sourceStation, String destinationStation, String travelDate) {
		  return trainRepository.findBySourceStationAndDestinationStationAndTravelDate(
	                sourceStation, destinationStation, travelDate);
	}
	

}
