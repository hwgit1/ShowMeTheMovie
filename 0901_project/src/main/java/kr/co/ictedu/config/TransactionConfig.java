package kr.co.ictedu.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@PropertySource("classpath:/application.properties")
@EnableTransactionManagement
public class TransactionConfig {

	@Autowired
	private DataSource dataSource;

	@Bean
	public PlatformTransactionManager txManager() throws Exception {
		return new DataSourceTransactionManager(dataSource);
	}//txManager

}//class

//이 파일만 있으면, 필요한 곳에서 @Transactional 사용 가능.
