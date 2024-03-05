package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String uqual = request.getParameter("uqual");
		String udes = request.getParameter("udes");
		
		HttpSession session = request.getSession();
		session.setAttribute("uqual",uqual);
		session.setAttribute("udes",udes);
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
		pw.println("<form method='post' action="+response.encodeURL("DisplayServlet")+">");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Email:<input type='text' name='email'>");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("User Mobile:<input type='text' name='mobile'>");
		pw.println("<br>");
		pw.println("<br>");
		pw.println("<input type='submit' value='Display'>");
		pw.println("</form>");
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");		
		
	}

}
