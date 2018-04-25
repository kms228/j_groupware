package com.jhta.groupware.work.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.RequestWorkService;
import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.WorkListVo;

@Controller
public class RequestWorkController {
	@Autowired private RequestWorkService requestWorkService;
	@Autowired private SetWorkService setWorkService;
	
	@RequestMapping("/requestWork/{emp_num}")
	public ModelAndView work_request(@PathVariable String emp_num) {
		ModelAndView mv = new ModelAndView(".work.work_request");
		//���ó�¥ ���ϱ�
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String wlist_start = date.format(today);
		//�����ȣ�� ���ó�¥ ����ֱ�
		Map<String, Object> map = new HashMap<>();
		map.put("emp_num", emp_num);
		map.put("wlist_start",wlist_start );
		//�ش�����ȣ�� ���ó�¥�� ���� PK�޾ƿ���
		WorkListVo vo =  requestWorkService.selectRequestWorkNum(map);
		int wlist_num = vo.getWlist_num();
		//�޾ƿ� PK�� ����ٽð� �޾ƿ���
		WorkListVo vo1 = requestWorkService.selectRequestWork(wlist_num);
		mv.addObject("work", vo1);
		return mv;
	}
	//��ٹ�ư(����� ���̺� ������Ʈ)
	@RequestMapping("/workEnd")
	public String work_end(@RequestParam Map<String, Object>map) {
		try {
			//���ó�¥ ���ϱ�
			Date today = new Date();
			SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
			String wlist_start = date.format(today);
			//���ó�¥ ����ֱ�
			map.put("wlist_start",wlist_start );
			//�ش�����ȣ�� ���ó�¥�� ���� PK�޾ƿ���
			WorkListVo vo =  requestWorkService.selectRequestWorkNum(map);
			int wlist_num = vo.getWlist_num();
			//����� ���̺� ��ٽð� ������Ʈ
			map.put("wlist_num", wlist_num);
			requestWorkService.insertRequestWorkEnd(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ".main";
		}
	}
	//��ٹ�ư
	@RequestMapping("/workStart")
	public String work_start(@RequestParam Map<String,Object> map) {
		System.out.println("--------------------RequestWorkController map---------------------");
		System.out.println("wlist_start : "+map.get("wlist_start"));
		System.out.println("wlist_type : "+map.get("wlist_type"));
		System.out.println("emp_num : "+map.get("emp_num"));
		System.out.println("--------------------RequestWorkController map---------------------");
		try {
			Date wtime_start =  setWorkService.selectWorkTime().getWtime_start();
			SimpleDateFormat format = new SimpleDateFormat("HHmm");
			//������ ��ٽð� int�� ����ȯ(�� 22:30 -> 2230)
			int wtime_start2 = Integer.parseInt(format.format(wtime_start));
			System.out.println("wtime_start2 : "+wtime_start2);
			
			//���� ��ٽð�(string��)�� dateŸ������ ����ȯ
			SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date d1 = format2.parse((String)map.get("wlist_start"));
			System.out.println(d1);
			//���� ��ٽð� dateŸ���� intŸ������ ����ȯ
			int wlist_start = Integer.parseInt(format.format(d1));
			System.out.println("wlist_start : "+wlist_start);
			//����(if.������ٽð�<������ٽð�)
			if(wtime_start2<wlist_start) {
				map.put("wlist_type","4");
			}
			requestWorkService.insertRequestWorkStart(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println("��ٽ��� ��ư Exception:"+e.getMessage());
			return ".main";
		}
		
	}
}









