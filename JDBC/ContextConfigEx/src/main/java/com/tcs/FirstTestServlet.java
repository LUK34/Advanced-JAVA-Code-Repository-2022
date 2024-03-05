package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FirstTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FirstTestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw= response.getWriter();
		
		ServletConfig sc= this.getServletConfig();
		pw.println("First Servlet init param-1"+ config.getInitParameter("homeloan"));
		
		;
	}

	
}
