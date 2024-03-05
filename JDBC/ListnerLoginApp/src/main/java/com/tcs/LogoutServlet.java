package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 Since the logout is a hyperlink. Hyperlink are by default doGet method.
		*/
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		HttpSession ses = request.getSession(false);
		ses.invalidate();
		/*
		 We set the above as false because the seesion id of the user that will be soon log
		 out has already been created via LoginServlet
		 */
		pw.println("<html>");
		pw.println("<body bgcolor='pink'>");
		pw.println("<center>");
		pw.print("You are successfully logged out.");
		pw.println("<br>");
		pw.println("</center>");
		pw.println("</body>");
		pw.println("</html>");		
		pw.close();	
	}

}
