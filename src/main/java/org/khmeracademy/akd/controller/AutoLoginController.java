package org.khmeracademy.akd.controller;

import javax.servlet.http.HttpServletResponse;

import org.khmeracademy.akd.entity.User;
import org.khmeracademy.akd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AutoLoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/auto-login" , method= RequestMethod.GET)
	public String autoLogin(@RequestParam("user-hash") String userHash , @RequestParam(name="continue-site", required=false , defaultValue="/") String continueSite , HttpServletResponse  response) {
		try{				
			//TODO : FIND USER BY USER_HASH FROM AKD DATABASE 
			User user = userService.findUserByUserHash(userHash);
			
			//TODO : CHECK IF USER DOESN'T EXIST OR EXIST IN AKD DATABASE 
			if(user == null){
				//TODO : Get user from KhmerAcademy Database by user hash to save into AKD Database 
				if(userService.registerUser(userHash)){					// IF USER REGISTER SUCCESSFUL TO AKD DATABASE
					user = userService.findUserByUserHash(userHash);	// CHECK USER AGAIN BY USER_HASH
					System.out.println("User from KhmerAcademy  has been saved into AKD Database successfully! Username : "+  user.getUsername());
				}else{													// IF USER REGISTER FAIL TO AKD DATABASE
					System.out.println("User from KhmerAcademy  has not been saved into AKD Database");
				}
			}else{
				System.out.println("User aleady exists in KhmerAcademy and AKD Databaes.");
			}
			
		//	System.out.println("Username : " + user.getUsername());
			
			//TODO : Set User Object into Spring Security Authentication
			Authentication authentication = new UsernamePasswordAuthenticationToken(user, user.getPassword(), user.getAuthorities());
	
			SecurityContext context = new SecurityContextImpl();
			
			//TODO : Set User authentication to SecurityContext
			context.setAuthentication(authentication);
			
			//TODO : store user information
			SecurityContextHolder.setContext(context);
			
			//System.out.println("Role: "+user.getRole());
			
			String roleName = user.getRole();
			if (roleName.contains("ADMIN")) {
				return "redirect:/admin/dashboard";
			}else if(roleName.contains("USER")){
				return "redirect:/userAccount";
			}else{
				return "redirect:"+continueSite;
			}

		
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:"+continueSite;

	}
}