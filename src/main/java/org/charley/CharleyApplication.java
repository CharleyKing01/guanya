package org.charley;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("org.charley.mapper")
public class CharleyApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharleyApplication.class, args);
	}
}
