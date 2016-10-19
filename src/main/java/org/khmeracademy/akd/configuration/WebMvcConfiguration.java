package org.khmeracademy.akd.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@Configuration
@PropertySource(
		value={"classpath:configuration.properties"}
)
public class WebMvcConfiguration extends WebMvcConfigurerAdapter{
	
	@Autowired
	private Environment environment;
	
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {	
		registry.addViewController("/accessDenied").setViewName("error/403");
		/*registry.addViewController("/login").setViewName("login");*/
	
	}
	
	//REST TEMPLATE
	/*@Bean
	public HttpHeaders header(){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "Basic Q2hpdm9ybjphZG1pbg==");
		return headers;
	}*/
	
	@Bean
	public RestTemplate restTemplate(){
		RestTemplate restTemplate = new RestTemplate();
		// Add the Jackson and String message converters
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
		return restTemplate;
	}
	
	@Bean(name="KNONGDAI_API_URL")
	public String knongDaiApiUrl(){
		return environment.getProperty("ACCOUNT.API.URL");
	}
	
	
	
	@Bean(name="KNONGDAI_API_SECRET_HEADER")
	public HttpHeaders knongDaiSecretHeader(){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String credentials = environment.getProperty("ACCOUNT.API.SECRET.HEADER");
		headers.set("Authorization", "Basic " + credentials);
		return headers;
	}
	
	@Bean(name="AKD_API_URL")
	public String AKD_API_URL(){
		return environment.getProperty("AKD.API.URL");
	}
	
	
	@Bean(name="LOGIN_URL")
	public String login(){
		return environment.getProperty("ACCOUNT_LOGIN_URL")+environment.getProperty("ACCOUNT_CONTINUE_SITE");
	}
	
	@Bean(name="REGISTER_URL")
	public String register(){
		return environment.getProperty("ACCOUNT.API.URL")+"/register"+environment.getProperty("ACCOUNT_CONTINUE_SITE")+"/register";
	}
	
	
	
	
	
}
