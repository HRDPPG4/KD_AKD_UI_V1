package org.khmeracademy.akd.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.khmeracademy.akd.entity.Role;
import org.khmeracademy.akd.entity.User;
import org.khmeracademy.akd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@PropertySource(
		value={"classpath:configuration.properties"}
)
public class UserServiceImpl implements UserService{

	@Autowired
	Environment environment;
	
	@Autowired
	private HttpHeaders header;
	
	@Autowired
	private RestTemplate rest;
	
	@Autowired
	private String AKD_API_URL;
	
	
	
	
	//TODO : Get User Object by user hash
	@Override
	public User findUserByUserHash(String userHash) {
		try{
			HttpEntity<Object> request = new HttpEntity<Object>(header);			
			ResponseEntity<Map> response = rest.exchange(AKD_API_URL + "/user/findUserByUserHash/"+userHash, HttpMethod.GET , request , Map.class);
			Map<String, Object> map = (HashMap<String, Object>)response.getBody();
			if(map.get("DATA") != null){
				Map<String , Object> data =  (Map<String, Object>) map.get("DATA");
				List<Role> roles = new ArrayList<>();
				User u = new User();
					
				u.setUserID((Integer) data.get("USER_ID"));
				u.setName((String)data.get("USER_NAME"));
				u.setPassword((String) data.get("PASSWORD"));
				u.setEmail((String) data.get("EMAIL"));
				u.setPhone((String) data.get("PHONE"));
				u.setCreatedDate((String) data.get("CREATED_DATE"));
				u.setRemark((String) data.get("REMARK"));
				u.setStatus((Integer) data.get("STATUS"));
				u.setRole("ROLE_USER");
				
				Role role = new Role();
				role.setRoleName((String)data.get("USER_ROLE"));
				roles.add(role);
				u.setRoles(roles);
				
				
				u.setUserHash((String) data.get("USER_HASH"));
				
				u.setProfile((String) data.get("PROFILE"));
				
				return u;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//TODO : Register user 
	@Override
	public boolean registerUser(String userHash) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String credentials = environment.getProperty("ACCOUNT.API.SECRET.HEADER");
		headers.set("Authorization", "Basic " + credentials);
		
		//TODO : Get user object by user hash from login.knongdai.com/knongdai/user/user-hash/{user-hash}
		HttpEntity<Object> request = new HttpEntity<Object>(headers);
		ResponseEntity<Map> response = rest.exchange(environment.getProperty("ACCOUNT.API.URL") + "/knongdai/user/user-hash/"+userHash, HttpMethod.POST , request , Map.class);
		Map<String, Object> map = (HashMap<String, Object>)response.getBody();
		System.out.println("=====> "  + map.get("DATA"));
		Map<String, Object> userMap = (Map<String, Object>) map.get("DATA");
		
		if(userMap != null){
			//TODO : If user object exists in KhmerAacademy Database, but user doesn't exist in TinhEy Database, so save user object in TinhEy Database
			User user = new User();
			user.setUserID((Integer) userMap.get("USER_ID"));
			user.setName((String)userMap.get("USERNAME"));
			user.setPassword((String) userMap.get("PASSWORD"));
			user.setEmail((String) userMap.get("EMAIL"));
			user.setPhone("");
			user.setCreatedDate((String) userMap.get("REGISTERED_DATE"));
			user.setRemark("");
			user.setStatus(1);
			user.setRole("ROLE_USER");
			user.setUserHash((String) userMap.get("USER_HASH"));
			user.setProfile((String) userMap.get("USER_IAMGE_URL"));
			
			
			System.out.println("//TODO : If user exists in KhmerAacademy Database, but user doesn't exists in AKD Database, so save user in AKD Database");
			
			//TODO : Save user from KhmerAcademy into TinhEy Database 
			HttpEntity<Object> savedRequest = new HttpEntity<Object>(user,header);
			/*ResponseEntity<Map> savedResponse = rest.exchange(WS_URL + "/user/register", HttpMethod.POST , savedRequest , Map.class);*/
			System.out.println(AKD_API_URL);
			ResponseEntity<Map> savedResponse = rest.exchange(AKD_API_URL + "/user", HttpMethod.POST , savedRequest , Map.class);
			Map<String, Object> savedMap = (HashMap<String, Object>)savedResponse.getBody();
			System.out.println("savedMap ====== > " + savedMap);
			return true;
		}else{
			System.out.println("//TODO : If user doesn't exists in KhmerAacademy.");
			return false;
		}
	}
}
