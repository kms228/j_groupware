package com.jhta.groupware.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@RequestMapping("/")
	public String home() {
		return ".main";
	}
	@RequestMapping("/calendar")
	public String calendar() {
		return ".calendar";
	}
}