package com.jhta.groupware.filter.LoginFilter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest requ = (HttpServletRequest)req;
		String[] getUrl = requ.getRequestURI().toString().split("/groupware");
		String requestMapping = getUrl[1];
		System.out.println("1");
		
		if(requestMapping != null &&!requestMapping.startsWith("/login")&&!requestMapping.startsWith("/endpoint")) {
			boolean login = false;
			HttpServletRequest request=(HttpServletRequest)req;
			HttpSession session = request.getSession();
			
			if(session!=null) {
				System.out.println("2");
				if(session.getAttribute("emp_num")!=null) {
					System.out.println("3");
					login=true;
				}
			}
			if(login) {
				System.out.println("4");
				chain.doFilter(req, resp);
			}else {
				System.out.println("5");
				HttpServletResponse response=(HttpServletResponse)resp;
				response.sendRedirect(request.getContextPath()+"/login");
			}
		}else {
			chain.doFilter(req, resp);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}
