package com.jhta.groupware.mem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemController {
	
	@RequestMapping(value="/memInfo",method=RequestMethod.GET)
	public String meminfo() {
		return ".login.memInfo";
	}
}
