package com.subrat.Project5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.subrat.Project5.model.Train;
import com.subrat.Project5.repository.TrainRepository;

@SpringBootApplication
public class Project5Application {


	public static void main(String[] args) {
		SpringApplication.run(Project5Application.class, args);
		
	}
	
	

}
