package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		String uname = request.getParameter("uname");
		String uage = request.getParameter("uage");
		
		/*
		  Using Cookie we can create Cookie objects(ck1,ck2). 
		  After storing the key and value pair in cookie object
		  we store ck1,ck2 into response object. 
		 */
		Cookie ck1= new Cookie("uname",uname);
		Cookie ck2= new Cookie("uage",uage);
		
		response.addCookie(ck1);
		response.addCookie(ck2);
		
		request.getRequestDispatcher("form2.html").forward(request,response);
	}

}
