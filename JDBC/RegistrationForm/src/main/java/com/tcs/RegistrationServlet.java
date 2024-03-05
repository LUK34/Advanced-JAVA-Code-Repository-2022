package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String[] qualification= request.getParameterValues("qualification");
		String gender = request.getParameter("gender");
		String[] technologies = request.getParameterValues("technologies");
		String address= request.getParameter("address");
		
		pw.println("html");
		pw.println("<body bgcolor='lightgreen'>");
		pw.println("<center><b><font size='6'>");
		pw.println("Username: "+username);
		pw.println("<br><br>");
		pw.println("Password: "+password);
		pw.println("<br><br>");
		
		pw.println("Qualification<br><br>");
		for(String qual: qualification)
		{
			pw.println(qual);
			pw.println("<br><br>");
		}
		
		pw.println("Gender: "+gender);
		pw.println("<br><br>");
		pw.println("Technologies<br><br>");
		for(String tech: technologies)
		{
			pw.println(tech);
			pw.println("<br><br>");
		}
		
		pw.println("Address: "+address);
		pw.println("<br><br>");
		pw.println("<br><br> Registraion Success.");
		pw.println("</font></b></center></body></html>");
	}
}