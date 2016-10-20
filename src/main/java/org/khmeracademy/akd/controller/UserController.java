package org.khmeracademy.akd.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserController {
	
	@Autowired
	private String LOGIN_URL;
	
	@Autowired
	private String REGISTER_URL;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(){
		return "index";
	}
	
	@RequestMapping(value="/feature/{filter}", method=RequestMethod.GET)
	public String feature(@PathVariable("filter") String filter, ModelMap model){
		//System.out.println("ID==>" + id);
		model.put("filter", filter);
		return "user/feature";
	}
	
	@RequestMapping(value="/search/{title}",method=RequestMethod.GET)
	public String search(@PathVariable("title") String title, ModelMap model){
		model.put("title", title);
		return "user/result-search";
	}
	
	
	@RequestMapping(value="/userAccount",method=RequestMethod.GET)
	public String user(){
		return "user/user";
	}
	
	@RequestMapping(value="/detail/{id}", method=RequestMethod.GET)
	public String detail(@PathVariable("id") String id, ModelMap model){
		//System.out.println("ID==>" + id);
		model.put("id", id);
		return "user/details";
	}
	
	@RequestMapping(value="/view/{ParentID}", method=RequestMethod.GET)
	public String viewPageByCategoryID(@PathVariable("ParentID") String ParentID, ModelMap model,@RequestParam("p") String menuName){
	//	System.out.println("mainMenu==>" + menuName);
		model.put("ParentID", ParentID);
		model.put("PAGE_TITLE", menuName);
		return "user/viewPageByCategoryID";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
		return new ModelAndView("redirect:" + LOGIN_URL);
    }
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register() {
		return new ModelAndView("redirect:" + REGISTER_URL);
    }
	
}

