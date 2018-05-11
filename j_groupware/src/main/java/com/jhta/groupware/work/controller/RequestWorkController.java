package com.jhta.groupware.work.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.work.service.AnnualService;
import com.jhta.groupware.work.service.RequestWorkService;
import com.jhta.groupware.work.service.SetWorkService;
import com.jhta.groupware.work.vo.AnnualVo;
import com.jhta.groupware.work.vo.WorkListVo;
import com.jhta.groupware.work.vo.WorkandWorkfileVo;

@Controller
public class RequestWorkController {
	@Autowired private RequestWorkService requestWorkService;
	@Autowired private SetWorkService setWorkService;
	@Autowired private AnnualService annualService;
	
	@RequestMapping(value="/requestWork/cancle",produces="application/json;charset=utf-8")
	@ResponseBody
	public String cancle(@RequestParam Map<String,Object> map) {
		//���
		int work_num = Integer.parseInt((String)map.get("work_num"));
		int n = requestWorkService.cancleWork(work_num);
		int m = requestWorkService.cancleWorkLine(work_num);
		JSONObject json = new JSONObject();
		if(n!=0 || m!=0) {//����
			json.put("result", true);
		}else {//����
			json.put("result", false);
		}
		return json.toString();
	}
	
	@RequestMapping("/requestAnn/{wtype}")
	public String insertAnn(@RequestParam Map<String, Object>map, HttpSession session,MultipartFile file,@PathVariable("wtype") String wtype) {
		String emp_num = (String)map.get("emp_num");
		int wtype_num = Integer.parseInt(wtype);
		map.put("wtype_num", wtype_num);
		//������� ���� �迭
		System.out.println("emp_num2 : "+map.get("emp_num2"));
		System.out.println("requestAnn.insertAnn.map : "+map);
		String emp_num2_before = (String)map.get("emp_num2");
		String[] emp_num2 = emp_num2_before.split(",");
		System.out.println("�迭�� ���� : "+emp_num2.length);
		for(String var:emp_num2) {
			System.out.println("�迭��.. : "+var);
		}
		 
		//����
		String uploadPath = session.getServletContext().getRealPath("/resources/file/workfile");
		String orgFileName = file.getOriginalFilename();
		String saveFileName = UUID.randomUUID()+"_"+orgFileName;
		map.put("wfile_savefilename", saveFileName);
		map.put("wfile_orgfilename", orgFileName);
		
		long fileSize = file.getSize();
		map.put("wfile_size", fileSize);
		System.out.println("���ϻ����� : "+fileSize);
		
		try {
			//���Ͽø���
			InputStream is = file.getInputStream();
			FileOutputStream fos = new FileOutputStream(uploadPath+"\\"+saveFileName);
			FileCopyUtils.copy(is, fos);
			
			//DB���ε� ������û(�⺻���� ��û����)
			if(wtype_num==1||wtype_num==5||wtype_num==6) {
				//����/����/������
				requestWorkService.insertAnn(map);
			}else if(wtype_num==2||wtype_num==3||wtype_num==4) {
				//����/����/�߱�
				requestWorkService.insertHalf(map);
			}
			//DB���ε� ������û(��û����-÷�����Ͼ��ε�)
			requestWorkService.insertAnnFile(map);
			//DB���ε� ������û(�������)
			int i=1;
			for(String var:emp_num2) {
				map.put("wline_level", i++);
				map.put("emp_num", var);
				requestWorkService.insertAnnSign(map);
			}
			
			return "redirect:/requestWork/"+emp_num;
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return ".main";
		}
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
//		System.out.println("--------------------RequestWorkController map---------------------");
//		System.out.println("wlist_start : "+map.get("wlist_start"));
//		System.out.println("wlist_type : "+map.get("wlist_type"));
//		System.out.println("emp_num : "+map.get("emp_num"));
//		System.out.println("--------------------RequestWorkController map---------------------");
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
				map.put("wlist_type","3");
				//��������
				
			}
			requestWorkService.insertRequestWorkStart(map);
			return "redirect:/requestWork/"+map.get("emp_num");
		}catch(Exception e) {
			System.out.println("��ٽ��� ��ư Exception:"+e.getMessage());
			return ".main";
		}
		
	}
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
		System.out.println("�ش�����ȣ�� ���ó�¥�� ���� PK�ޱ�");
		
		//�ش� ����� �������� ��������
		
		Map<String, Object> amap = new HashMap<>();
		amap.put("emp_num", Integer.parseInt(emp_num));
		SimpleDateFormat ann = new SimpleDateFormat("yyyy");
		String ann_ann = ann.format(today);
		System.out.println("��μ�"+ann_ann);
		amap.put("ann_ann", Integer.parseInt(ann_ann));
		AnnualVo annVo = annualService.selectAnn(amap);
		
		//�ش� ����� ����(����) ��û����Ʈ ��������
		List<WorkandWorkfileVo> wwlist = requestWorkService.selectMyRequest(Integer.parseInt(emp_num));
		System.out.println("�ش� ����� ���� ��û����Ʈ ��������");
		if(vo!=null) {
			int wlist_num = vo.getWlist_num();
			//�޾ƿ� PK�� ����ٽð� �޾ƿ���
			WorkListVo vo1 = requestWorkService.selectRequestWork(wlist_num);
			mv.addObject("work", vo1);
			mv.addObject("annual", annVo);
			mv.addObject("wwlist", wwlist);
			return mv;
		}else {
			return mv;
		}
	}
}









