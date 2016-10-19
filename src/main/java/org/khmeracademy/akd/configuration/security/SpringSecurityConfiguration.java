package org.khmeracademy.akd.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
@PropertySource(
		value={"classpath:configuration.properties"}
)
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter{
	@Autowired
	private Environment environment;
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/admin/**").hasAnyRole("ADMIN")
		.antMatchers("/user/**").hasRole("USER");
		http
			.formLogin()
			.loginPage(environment.getProperty("ACCOUNT_LOGIN_URL")+environment.getProperty("ACCOUNT_CONTINUE_SITE"))
			.usernameParameter("username")
			.passwordParameter("password")
			.permitAll();
		http
			.sessionManagement()
			.sessionAuthenticationErrorUrl(environment.getProperty("ACCOUNT_LOGIN_URL")+environment.getProperty("ACCOUNT_CONTINUE_SITE"))
			.maximumSessions(1)
			.maxSessionsPreventsLogin(true)
			.expiredUrl(environment.getProperty("ACCOUNT_LOGIN_URL")+environment.getProperty("ACCOUNT_CONTINUE_SITE"))
			.sessionRegistry(sessionRegistryImpl());
		http
			.logout()
			.logoutUrl("/logout")
			//.logoutSuccessUrl(environment.getProperty("ACCOUNT_LOGOUT_URL"))
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.deleteCookies("JESSIONID",environment.getProperty("ACCOUNT_KNONG_DAI_COOKIE_NAME"))
			.permitAll();
		
		http.csrf().disable();
		http.exceptionHandling().accessDeniedPage("/accessDenied");
	}

	@Bean
	protected SessionRegistry sessionRegistryImpl(){
		return new SessionRegistryImpl();
	}
}
