package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 Annotations will not be updated in web.xml file but it will be present in the servlet as 
  */
@WebServlet(urlPatterns= {"/FirstServlet"},
			initParams= {@WebInitParam(name="user1", value="ratan"),
						 @WebInitParam(name="user2", value="anu")
						})
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public FirstServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		pw.println("This is Annotated Servlet");
		ServletConfig config= this.getServletConfig();
		pw.println(config.getInitParameter("user1"));
		pw.println("<br><br>");
		pw.println(config.getInitParameter("user2"));
		
	}
}
