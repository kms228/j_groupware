package com.jhta.groupware.emplist.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/nboardlist")
public class NboardListController {
	public String NboardList() {
		return ".login.notic_Board";
	}
	

}
