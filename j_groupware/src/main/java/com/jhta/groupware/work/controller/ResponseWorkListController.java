package com.jhta.groupware.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResponseWorkListController {
	@RequestMapping("/responseWorkList")
	public String work_responseList() {
		return ".work.work_responseList";
	}
}
