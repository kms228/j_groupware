package com.jhta.groupware.empinfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EmpInfoController {
	@RequestMapping(value="/empinfo",method=RequestMethod.GET)
	public String empinfo() {
		return ".login.empinfo";
	}
}
