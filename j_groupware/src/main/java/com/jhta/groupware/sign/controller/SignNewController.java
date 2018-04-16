package com.jhta.groupware.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignNewController {
	
	@RequestMapping("/signnew")
	public String signnew() {
		return ".sign.sign_new";
	}
}
