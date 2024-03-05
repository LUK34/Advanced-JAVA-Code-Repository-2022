package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String uage = request.getParameter("uage");
		
		HttpSession session = request.getSession();
		session.setAttribute("uname",uname);
		session.setAttribute("uage",uage);
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		/*
		 If the cookies are disabled we will follow the below approach.
		 1.Below lines of code we are adding second form details in response object.
		 2.Here encodeURL-> whatever be the session id present. This session id is appended to URL pattern.
		 3.Along with the URL the session id is coming to server. So even if the cookies are disabled this will work.
		 The code will work if u disable the cookies.
		 */
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
		pw.println("<form method='post' action="+response.encodeURL("SecondServlet")+">");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Qualification:<input type='text' name='uqual'>");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Designation:<input type='text' name='udes'>");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("<input type='submit' value='Next'>");
		pw.println("</form>");
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");			
		
	}

}
