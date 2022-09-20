package kr.co.ictedu.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.ictedu.login.LoginCheckInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor())
		.addPathPatterns("/basket/*")
		.addPathPatterns("/board/ck/*")
		.addPathPatterns("/board/member/*")
		.addPathPatterns("/credit/card/*")
		.addPathPatterns("/delivery/*")
		.addPathPatterns("/history/*")
		.addPathPatterns("/mypage/*")
		.addPathPatterns("/order/*")
		.addPathPatterns("/product/*")
		.addPathPatterns("/seat")
		.excludePathPatterns("/board/ck/list")
		.excludePathPatterns("/board/member/list")
		.excludePathPatterns("/product/list")
		.excludePathPatterns("/product/detail")
		
		;
	}//addInterceptors

}//class
