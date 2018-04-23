package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestWorkListController {
	@RequestMapping("/requestWorkList")
	public String work_requestList() {
		return ".work.work_requestList";
	}
}
