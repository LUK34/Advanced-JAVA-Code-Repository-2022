package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		
		String user=request.getParameter("uname");
		
		
		HttpSession session = request.getSession();
		
		ServletContext ctx=request.getServletContext();
		int t=(Integer)ctx.getAttribute("totalusers");
		int c=(Integer)ctx.getAttribute("currentusers");
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
		pw.println("<h1> Welcome "+user+"</h1>");
		pw.println("Total Users = "+t+" || Current Users = "+c);
		pw.println("<br>");
		pw.println("<a href='LogoutServlet'>Logout</a>");
		pw.println("<br>");
		
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");		
		/*
		 Since the logout is a hyperlink. Hyperlink are by default doGet method.
		  */
		pw.close();
	}

}
