package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class WorkController {
	@RequestMapping("/work")
	public String work() {
		return ".work.work";
	}
	
}
