package com.snappbox.springargocdk8s;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@Slf4j
@SpringBootApplication
public class SpringArgocdK8sApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringArgocdK8sApplication.class, args);
	}

	@Bean
	ApplicationRunner runner(){
		return args -> {
			log.info("Application Version: V3");
		};
	}

}
