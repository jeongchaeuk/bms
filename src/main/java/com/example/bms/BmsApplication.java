package com.example.bms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EntityScan(basePackages = {"com.example.bms.entity"})
@EnableJpaRepositories(basePackages = {"com.example.bms.repository"})
@SpringBootApplication
public class BmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(BmsApplication.class, args);
	}

}
