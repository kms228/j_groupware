package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WorkListController {
	@RequestMapping("/workList")
	public String work_list() {
		return ".work.work_list";
	}
}
