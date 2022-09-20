package kr.co.ictedu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class UploadPathConfig implements WebMvcConfigurer {
	
	private String resourcePath = "file:///C:/upload/";
	private String uploadPath = "/upload/**";
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(uploadPath)
				.addResourceLocations(resourcePath);
	}//addResourceHandlers

}//class//contributor:오혜원
