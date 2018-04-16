package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class WorkController {

	@RequestMapping("/requestWork")
	public String work_request() {
		return ".work.work_request";
	}
	@RequestMapping("/requestWorkList")
	public String work_requestList() {
		return ".work.work_requestList";
	}
	@RequestMapping("/responseWorkList")
	public String work_responseList() {
		return ".work.work_responseList";
	}
	@RequestMapping("/work")
	public String work() {
		return ".work.work";
	}
	@RequestMapping("/setWork")
	public String work_set() {
		return ".work.work_set";
	}
	@RequestMapping("/workList")
	public String work_list() {
		return ".work.work_list";
	}
	
}
