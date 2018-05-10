package com.jhta.groupware.emplist.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.groupware.acadeemic.vo.AcademicVo;
import com.jhta.groupware.career.vo.CareerVo;
import com.jhta.groupware.dept.vo.DeptVo;
import com.jhta.groupware.empinfo.service.EmpInfoService;
import com.jhta.groupware.emplist.service.EmpListService;
import com.jhta.groupware.emplist.vo.EmpListVo;
import com.jhta.groupware.history.vo.HistoryVo;
import com.jhta.groupware.login.vo.LoginVo;
import com.jhta.groupware.member.vo.MemberAccountVo;
import com.jhta.groupware.position.vo.PositionVo;

@Controller
public class EmpListController {
	@Autowired
	private EmpListService service;
	@Autowired
	private EmpInfoService service2;
	
	@RequestMapping("/emplist") 
	public ModelAndView emplist(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView(".login.emplist");
		//HttpSession session=req.getSession();	
		List<EmpListVo> emplist=service.getList();
		mv.addObject("list",emplist);
		System.out.println("List controller");
		return mv;
	}
	@RequestMapping("/empselect")
	public ModelAndView empselect(int EMP_NUM) {
		ModelAndView mv =new ModelAndView(".login.empSelectView");
		System.out.println(EMP_NUM+"조회할 회원번호");
		// 1.사원개인정보
		LoginVo vo1=service2.getEmp(EMP_NUM);
		// 2.계정정보
		MemberAccountVo vo2=service2.getAcc(EMP_NUM);
		// 3.부서정보
		DeptVo vo3=service2.getDept(EMP_NUM);
		// 4.직위정보
		PositionVo vo4=service2.getPos(EMP_NUM);
		// 5.학력정보
		List<AcademicVo> vo5=service2.getAcad(EMP_NUM);
		// 6.경력정보
		List<CareerVo> vo6=service2.getCareer(EMP_NUM);
		// 7.근무이력
		List<HistoryVo> vo7=service2.getHis(EMP_NUM);
		
		mv.addObject("vo1", vo1);
		mv.addObject("vo2", vo2);
		mv.addObject("vo3", vo3);
		mv.addObject("vo4", vo4);
		mv.addObject("vo5", vo5);
		mv.addObject("vo6", vo6);
		mv.addObject("vo7", vo7);
		return mv;
	}
	@RequestMapping("/updateEmp")
	public ModelAndView updateEmp(int EMP_NUM,String EMP_NAME,String EMP_GENDER,String EMP_PHONE,String EMP_EMAIL,
				String EMP_BIRTH,String EMP_HIREDATE,String EMP_ADDR,int DEPT_NUM,int PST_NUM) {
		
		HashMap<String,Object>map = new HashMap<>();
		map.put("EMP_NUM",EMP_NUM);
		map.put("EMP_NAME",EMP_NAME);
		map.put("EMP_PHONE",EMP_PHONE);
		map.put("EMP_EMAIL",EMP_EMAIL);
		map.put("EMP_BIRTH",EMP_BIRTH);
		map.put("EMP_GENDER",EMP_GENDER);
		map.put("EMP_HIREDATE",EMP_HIREDATE);
		map.put("EMP_ADDR",EMP_ADDR);
		map.put("DEPT_NUM",DEPT_NUM);
		map.put("PST_NUM",PST_NUM);
		
		int n = service.updateEmp(map);
		if(n>0) {
			System.out.println(n+"n이 뭘까?");
			ModelAndView mv =new ModelAndView(".login.emplist");
			mv.addObject("EMP_NUM",EMP_NUM);
			return mv;
		}else {
			System.out.println(n+"뭐가 넘어오나?");
			ModelAndView mv =new ModelAndView(".login.empSelectView");
			return  mv;
		}
	}
	@RequestMapping("/updateAccount")
	public String updateAccount(int EMP_NUM,int ACNT_NUM,String ACNT_id,String ACNT_pwd,String ACNT_level) {
		
		HashMap<String,Object>map=new HashMap<>();
		map.put("ACNT_NUM",ACNT_NUM);
		map.put("ACNT_id",ACNT_id);
		map.put("ACNT_pwd",ACNT_pwd);
		map.put("ACNT_level",ACNT_level);
		map.put("EMP_NUM",EMP_NUM);
		int n = service.updateAcc(map);
		System.out.println("Account 수정 동작실행");
		if(n>0) {
			//ModelAndView mv =new ModelAndView(".login.emplist");
			//mv.addObject("EMP_NUM",EMP_NUM);
			System.out.println("Account 수정 동작완료");
			return "redirect:/emplist";
		}else {
			//ModelAndView mv =new ModelAndView(".login.emplist");
			//mv.addObject("EMP_NUM",EMP_NUM);
			System.out.println("Account 수정 동작실패");
			return "redirect:/emplist";
		}
		
	}
	
	@RequestMapping(value="/delacademic2")
	public String delaca(int ACD_NUM) {
		try {
			service2.delete(ACD_NUM);
			System.out.println(ACD_NUM+"삭제!");
			return "redirect:/emplist";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/emplist";
		}
	}
	
	@RequestMapping(value="/delcareer2")
	public String delcareer(int CRR_NUM) {
		try {
			service2.deletecar(CRR_NUM);
			System.out.println(CRR_NUM+"삭제!");
			return "redirect:/emplist";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/emplist";
		}
	}
	@RequestMapping(value="/delhis2")
	public String delhis(int HIS_NUM) {
		try {
			service2.deletehis(HIS_NUM);
			System.out.println(HIS_NUM+"삭제!");
			return "redirect:/emplist";
		}catch (Exception e) {
			e.printStackTrace();
			return "redirect:/emplist";
		}
	}
	////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/insertaca2",method=RequestMethod.GET)
	public String insertaca(String ACD_NAME,String ACD_GRADUATION
			,String ACD_MAJOR,String ACD_SCORE,int EMP_NUM) {
			HashMap<String,Object>map=new HashMap<String,Object>();
			map.put("ACD_NAME", ACD_NAME);
			map.put("ACD_GRADUATION", ACD_GRADUATION);
			map.put("ACD_MAJOR", ACD_MAJOR);
			map.put("ACD_SCORE", ACD_SCORE);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service2.insertacc(map);
			
			System.out.println(ACD_GRADUATION);
			System.out.println("ajax넘어오나?");
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				return "redirect:/emplist";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/emplist";
			}
	}
	@RequestMapping(value="/insertcarrer2",method=RequestMethod.GET)
	public String insertaca(String CRR_NAME,String CRR_DEPT
			,String CRR_POSITION,String CRR_WORK,String CRR_SDATE,
			String CRR_EDATE,int EMP_NUM) {
			HashMap<String,Object>map=new HashMap<String,Object>();
			System.out.println(CRR_NAME+CRR_DEPT+CRR_POSITION+CRR_WORK+CRR_SDATE+CRR_EDATE+EMP_NUM);
			map.put("CRR_NAME", CRR_NAME);
			map.put("CRR_DEPT", CRR_DEPT);
			map.put("CRR_POSITION", CRR_POSITION);
			map.put("CRR_WORK", CRR_WORK);
			map.put("CRR_SDATE", CRR_SDATE);
			map.put("CRR_EDATE", CRR_EDATE);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service2.insertcar(map);
		
			System.out.println(CRR_NAME);
			System.out.println("경력추가완료");
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				return "redirect:/emplist";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/emplist";
			}
	}
	@RequestMapping(value="/inserthis2",method=RequestMethod.GET)
	public String insertaca(String HIS_NUM,String HIS_DATE,String HIS_POSITION,
			String HIS_WORK,String HIS_DEPT,int EMP_NUM) {
		//try {
			HashMap<String,Object>map=new HashMap<String,Object>();
			System.out.println(HIS_DATE+HIS_POSITION+HIS_WORK+EMP_NUM);
			map.put("HIS_DATE", HIS_DATE);
			map.put("HIS_POSITION", HIS_POSITION);
			map.put("HIS_WORK", HIS_WORK);
			map.put("HIS_DEPT",HIS_DEPT);
			map.put("EMP_NUM", EMP_NUM);
		    int n = service2.inserthis(map);
		
			System.out.println("근무이력추가완료");
			if(n>0) {
				System.out.println(n+"n이 뭘까?");
				return "redirect:/emplist";
			}else {
				System.out.println(n+"뭐가 넘어오나?");
				return "redirect:/emplist";
			}
	}
	@RequestMapping(value="/insertre",method=RequestMethod.GET)
	public String insertre(String RE_DATE,int EMP_NUM) {
		HashMap<String,Object>map=new HashMap<>();
		System.out.println(RE_DATE+"퇴사일"+EMP_NUM);
		map.put("RE_DATE", RE_DATE);
		map.put("EMP_NUM",EMP_NUM);
		
		int n = service.insertRe(map);
		System.out.println("퇴직처리 완료");
		if(n<0) {
			return "redirect:/emplist";
		}else {
			return "redirect:/emplist";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}









