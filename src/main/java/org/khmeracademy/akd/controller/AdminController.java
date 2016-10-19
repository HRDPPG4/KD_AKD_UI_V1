package org.khmeracademy.akd.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AdminController {
	
	@RequestMapping(value={"/admin/dashboard","/admin","/admin/index","/admin/home"},method=RequestMethod.GET)
	public String dashboard(ModelMap map){
		map.put("CURRENT_PAGE", "dashboard");
		return "admin/dashboard";
	}
	@RequestMapping(value="/admin/slide",method=RequestMethod.GET)
	public String slide(ModelMap map){
		map.put("CURRENT_PAGE", "slide");
		return "admin/slide";
	}
	
	@RequestMapping(value="/admin/user",method=RequestMethod.GET)
	public String user(ModelMap map){
		map.put("CURRENT_PAGE", "user");
		return "admin/user";
	}
	
	@RequestMapping(value="/admin/comment",method=RequestMethod.GET)
	public String comment(ModelMap map){
		map.put("CURRENT_PAGE", "comment");
		return "admin/comment";
	}
	
	@RequestMapping(value="/admin/savelist",method=RequestMethod.GET)
	public String savelist(ModelMap map){
		map.put("CURRENT_PAGE", "savelist");
		return "admin/savelist";
	}
	
	
	@RequestMapping(value="/admin/feedback",method=RequestMethod.GET)
	public String feedback(ModelMap map){
		map.put("CURRENT_PAGE", "feedback");
		return "admin/feedback";
	}
	
	@RequestMapping(value="/admin/category",method=RequestMethod.GET)
	public String mainCategory(ModelMap map){
		map.put("CURRENT_PAGE", "category");
		return "admin/category";
	}
	
	@RequestMapping(value="/admin/report",method=RequestMethod.GET)
	public String report(ModelMap map){
		map.put("CURRENT_PAGE", "report");
		return "admin/report";
	}

	
}
