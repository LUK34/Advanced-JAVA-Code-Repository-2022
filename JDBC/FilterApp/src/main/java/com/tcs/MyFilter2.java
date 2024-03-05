package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class MyFilter2 implements Filter {

   
    public MyFilter2() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		String addr= request.getParameter("uaddr");
		
		if(addr.equalsIgnoreCase("Hyderbad"))
		{
			chain.doFilter(request, response);
		}
		else
		{
			pw.println("This application is for hyderbad users only.");
			request.getRequestDispatcher("form.html").include(request,response);
		}
		//If MyFilter1 and MyFilter2 conditions are satisfied it will go to RegServlet.
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
