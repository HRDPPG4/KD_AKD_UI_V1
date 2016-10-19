package org.khmeracademy.akd.entity;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Role implements GrantedAuthority {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;
	
	@JsonProperty("ROLE_ID")
	private int roleId;
	
	@JsonProperty("ROLE_NAME")
	private String roleName;
	
	private int userid;
	
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return roleName;
	}
	
	

}
