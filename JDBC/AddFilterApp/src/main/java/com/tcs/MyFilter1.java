package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;


@WebFilter("/AddServlet")
public class MyFilter1 implements Filter {

   
    public MyFilter1() {
    }
	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		int num1= Integer.parseInt(request.getParameter("num1"));
		
		if(int(num1))
		{
			chain.doFilter(request, response);
		}
		else
		{
			pw.println("The data is not numeric");
			request.getRequestDispatcher("form.html").include(request,response);
		}
	}
	

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
