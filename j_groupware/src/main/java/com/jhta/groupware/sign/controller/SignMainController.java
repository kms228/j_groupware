package com.jhta.groupware.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignMainController {

	@RequestMapping("/signmain")
	public String signMain() {
		return ".sign.sign_main";
	}
}
