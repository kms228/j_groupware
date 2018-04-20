package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestWorkController {

	@RequestMapping("/requestWork")
	public String work_request() {
		return ".work.work_request";
	}
}
