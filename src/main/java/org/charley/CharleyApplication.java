package org.charley;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication
@MapperScan("org.charley.mapper")
public class CharleyApplication {

	public static void main(String[] args) {
		SpringApplication.run(CharleyApplication.class, args);
	}
}

//打包使用
//public class CharleyApplication extends SpringBootServletInitializer {
//
//	@Override
//	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
//		return application.sources(CharleyApplication.class);
//	}
//
//	public static void main(String[] args) throws Exception {
//		SpringApplication.run(CharleyApplication.class, args);
//	}
//}
