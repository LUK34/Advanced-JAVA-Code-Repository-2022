package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//When form3 is getting filled 2 request 4 cookies are store in request
		/*
			In this case since there are 2 request , each request storing 2 cookies each. 
			A total of 4 cookies are present. We store the 4 cookies in array object.
		  */
		
		Cookie[] cks=request.getCookies();
		
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center><h1>");
		pw.println("<br><br>");
		
		pw.println("User Name:"+cks[0].getValue()+"<br><br>");
		pw.println("User Age:"+cks[1].getValue()+"<br><br>");
		pw.println("Qualification:"+cks[2].getValue()+"<br><br>");
		pw.println("Designation:"+cks[3].getValue()+"<br><br>");
		
		pw.println("Email:"+request.getParameter("email")+"<br><br>");
		pw.println("Mobile:"+request.getParameter("mobile")+"<br><br>");
		
		pw.println("</h1></center>");
		pw.println("</body>");
		pw.println("</html>");
	}

}
