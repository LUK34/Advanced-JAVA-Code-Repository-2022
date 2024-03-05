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
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		HttpSession session = request.getSession(false);
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
		pw.println("User Name: "+session.getAttribute("uname"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Age: "+session.getAttribute("uage"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Qualification: "+session.getAttribute("uqual"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Designation: "+session.getAttribute("udes"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Email id: "+request.getParameter("email"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Mobile: "+request.getParameter("mobile"));
		pw.println("<br>");
		pw.println("<br>");
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");	
	}

}
