package com.jhta.groupware.empinfo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.service.EmpInfoService;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
import com.jhta.groupware.position.vo.PositionVo;

@Controller
public class EmpInfoController {
	@Autowired 
	private EmpInfoService service;
	
	@RequestMapping(value="/empinfo",method=RequestMethod.GET)
	public ModelAndView empinfo(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView(".login.empinfo");
		HttpSession session = req.getSession();
		int EMP_NUM=(Integer)session.getAttribute("emp_num");
		System.out.println(EMP_NUM);
		LoginVo vo1 = service.getEmp(EMP_NUM);
		
		List<AcademicVo> vo2=service.getAcad(EMP_NUM);
		
		List<CareerVo> vo3=service.getCareer(EMP_NUM);
		
		List<HistoryVo> vo4=service.getHis(EMP_NUM);
		
		PositionVo vo5=service.getPos(EMP_NUM);
		DeptVo vo6=service.getDept(EMP_NUM);
		MemberAccountVo vo7=service.getAcc(EMP_NUM);

		System.out.println(vo1);
		System.out.println(vo2);
		System.out.println(vo3);
		mv.addObject("vo1",vo1);
		mv.addObject("vo2",vo2);
		mv.addObject("vo3",vo3);
		mv.addObject("vo4",vo4);
		mv.addObject("vo5",vo5);
		mv.addObject("vo6",vo6);
		mv.addObject("vo7",vo7);
		return mv;
	}
	@RequestMapping(value="/delacademic")
	public String delaca(int ACD_NUM) {
		try {
			service.delete(ACD_NUM);
			System.out.println(ACD_NUM+"삭제!");
			return "redirect:/empinfo";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/empinfo";
		}
	}
	
	@RequestMapping(value="/delcareer")
	public String delcareer(int CRR_NUM) {
		try {
			service.deletecar(CRR_NUM);
			System.out.println(CRR_NUM+"삭제!");
			return "redirect:/empinfo";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/empinfo";
		}
	}
	@RequestMapping(value="/delhis")
	public String delhis(int HIS_NUM) {
		try {
			service.deletehis(HIS_NUM);
			System.out.println(HIS_NUM+"삭제!");
			return "redirect:/empinfo";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/empinfo";
		}
	}
	
	@RequestMapping(value="/insertaca",method=RequestMethod.GET)
	public String insertaca(String ACD_NAME,String ACD_GRADUATION
			,String ACD_MAJOR,String ACD_SCORE,HttpSession session) {
		//try {
			HashMap<String,Object>map=new HashMap<String,Object>();
			//int EMP_NUM1=Integer.parseInt(EMP_NUM);
			int EMP_NUM=(Integer)session.getAttribute("emp_num");
			map.put("ACD_NAME", ACD_NAME);
			map.put("ACD_GRADUATION", ACD_GRADUATION);
			map.put("ACD_MAJOR", ACD_MAJOR);
			map.put("ACD_SCORE", ACD_SCORE);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service.insertacc(map);
			
			System.out.println(ACD_GRADUATION);
			//JSONObject ob = new JSONObject();
			System.out.println("ajax넘어오나?");
			//ob.put("acc", "success");
			//return ob.toString();
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				//String emp_num=Integer.toString(EMP_NUM1);
				return "redirect:/empinfo";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/empinfo";
			}
		//}catch (Exception e) {
			//e.printStackTrace();
			//JSONObject ob = new JSONObject();
			//ob.put("acc", "fail");
			//return ob.toString();
			
		//}
	}
	@RequestMapping(value="/insertcarrer",method=RequestMethod.GET)
	public String insertaca(String CRR_NAME,String CRR_DEPT
			,String CRR_POSITION,String CRR_WORK,String CRR_SDATE,
			String CRR_EDATE,HttpSession session) {
		//try {
			HashMap<String,Object>map=new HashMap<String,Object>();
			int EMP_NUM=(Integer)session.getAttribute("emp_num");
			System.out.println(CRR_NAME+CRR_DEPT+CRR_POSITION+CRR_WORK+CRR_SDATE+CRR_EDATE+EMP_NUM);
			map.put("CRR_NAME", CRR_NAME);
			map.put("CRR_DEPT", CRR_DEPT);
			map.put("CRR_POSITION", CRR_POSITION);
			map.put("CRR_WORK", CRR_WORK);
			map.put("CRR_SDATE", CRR_SDATE);
			map.put("CRR_EDATE", CRR_EDATE);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service.insertcar(map);
		
			System.out.println(CRR_NAME);
			System.out.println("경력추가완료");
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				return "redirect:/empinfo";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/empinfo";
			}
	}
	@RequestMapping(value="/inserthis",method=RequestMethod.GET)
	public String insertaca(String HIS_NUM,String HIS_DATE,String HIS_POSITION,
			String HIS_WORK,String HIS_DEPT,HttpSession session) {
		//try {
			HashMap<String,Object>map=new HashMap<String,Object>();
			int EMP_NUM=(Integer)session.getAttribute("emp_num");
			System.out.println(HIS_DATE+HIS_POSITION+HIS_WORK+EMP_NUM);
			map.put("HIS_DATE", HIS_DATE);
			map.put("HIS_POSITION", HIS_POSITION);
			map.put("HIS_WORK", HIS_WORK);
			map.put("HIS_DEPT",HIS_DEPT);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service.inserthis(map);
		
			System.out.println("근무이력추가완료");
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				return "redirect:/empinfo";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/empinfo";
			}
	}
}
















  