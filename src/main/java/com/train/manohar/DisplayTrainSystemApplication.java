package com.train.manohar;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.train.manohar.repositories")
@EntityScan("com.train.manohar.domain")
public class DisplayTrainSystemApplication {

	public static void main(String[] args) {
		SpringApplication.run(DisplayTrainSystemApplication.class, args);
	}
}
