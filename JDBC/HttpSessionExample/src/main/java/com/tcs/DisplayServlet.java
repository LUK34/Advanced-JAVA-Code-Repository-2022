package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		
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
		
		
		HttpSession session = request.getSession(false);
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center><h1>");
		pw.println("<br><br>");
		
		pw.println("User Name:"+session.getAttribute("uname")+"<br><br>");
		pw.println("User Age:"+session.getAttribute("uage")+"<br><br>");
		pw.println("Qualification:"+session.getAttribute("uqual")+"<br><br>");
		pw.println("Designation:"+session.getAttribute("udesig")+"<br><br>");
		
		pw.println("Email:"+request.getParameter("email")+"<br><br>");
		pw.println("Mobile:"+request.getParameter("mobile")+"<br><br>");
		
		pw.println("</h1></center>");
		pw.println("</body>");
		pw.println("</html>");
	}

}
