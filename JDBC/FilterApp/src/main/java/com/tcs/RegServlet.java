package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter pw= response.getWriter();
		
		String uname = request.getParameter("uname");
		String uage= request.getParameter("uage");
		String uaddr=request.getParameter("uaddr");
		
		pw.println("********* Registration Success *********");
		pw.println("<br>");
		pw.println("User Name= "+uname+"<br>");
		pw.println("User Age= "+uage+"<br>");
		pw.println("User Address= "+ uaddr+"<br>");
		pw.println("We will find you a girl soon...");
	}

}
