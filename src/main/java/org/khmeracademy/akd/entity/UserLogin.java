package org.khmeracademy.akd.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserLogin {
	
	@JsonProperty("EMAIL")
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
