package com.subrat.Project5.runner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.subrat.Project5.model.Train;
import com.subrat.Project5.repository.TrainRepository;

@Component
public class SpringRunner implements CommandLineRunner {

	   @Autowired
	   private TrainRepository trainRepository;
	@Override
	public void run(String... args) throws Exception {
		saveFirstTrain();
	}
	
	
	public void saveFirstTrain() {
//		Train train=new Train();
//		train.setAvailableSeats(100);
//		train.setDestinationStation("bbsr");
//		train.setSourceStation("hyd");
//		train.setTrainNumber("1234");
//		train.setTravelDate("11");
//		trainRepository.save(train);
//		Train train1=new Train();
//		train1.setAvailableSeats(10);
//		train1.setDestinationStation("bbsr");
//		train1.setSourceStation("hyd");
//		train1.setTrainNumber("5678");
//		train1.setTravelDate("11");
//		trainRepository.save(train1);
	}

}
