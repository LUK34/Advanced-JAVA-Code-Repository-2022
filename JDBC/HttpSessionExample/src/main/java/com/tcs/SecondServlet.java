package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uqual=request.getParameter("uqual");
		String udesig=request.getParameter("udesig");
		
		//The below line is used to create the session object
		/*
		 request.getSession()
		 1.here the argument is by default true.
		 2.It will create the new session object
		 3.If the object is available with some data
		 
		 request.getSession(false)
		 1. If the object is available it will locate the object.
		 2. If the object is not available it will throw exception.
		 
		 first request we use getSession() is a good method because we have to create the object.
		 second request we use getSession(false) because already the object is created through the first request.
		 i.e any request after first request the getSession(false)
		 */
		HttpSession session = request.getSession();
		//session object is "session" and the variable is "uqual". this variable that is stored in session object.
		session.setAttribute("uqual",uqual);
		session.setAttribute("udesig",udesig);
		//session object is specific to user.
		
		request.getRequestDispatcher("form3.html").forward(request, response);
		
	}

}
