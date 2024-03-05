package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// General Settings
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		//Get the requested data
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	
		//Request processing logic
		if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin"))
		{
			//pw.println("Welcome "+username);
			//response.sendRedirect("http://www.youtube.com");
			
			//RequestDispatcher dis = request.getRequestDispatcher("success.html");
			//dis.forward(request,response);
			
			pw.println("This is Success");
			pw.println("That is Success");
			RequestDispatcher dis = request.getRequestDispatcher("SuccessServlet");
			dis.forward(request,response);
		}
		else
		{
			//pw.println("Login Failed. Please try again.");
			//response.sendError(808,"Login Fail. Please try with valid data.");
			
			//RequestDispatcher dis = request.getRequestDispatcher("error.html");
			//dis.forward(request,response);
			
			pw.println("This is Fail");
			pw.println("That is Fail");
			pw.println(".....Please try again");
			RequestDispatcher dis = request.getRequestDispatcher("login.html");
			dis.forward(request,response);
			//dis.include(request,response);
		}
	};

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
