package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public FirstServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String uname=request.getParameter("uname");
		String uage=request.getParameter("uage");
		
		//The below line is used to create the session object
		HttpSession session = request.getSession();
		//session object is "session" and the variable is "uname". this variable that is stored in session object.
		session.setAttribute("uname",uname);
		session.setAttribute("uage",uage);
		//session object is specific to user.
		
		request.getRequestDispatcher("form2.html").forward(request, response);
		
	}

}
