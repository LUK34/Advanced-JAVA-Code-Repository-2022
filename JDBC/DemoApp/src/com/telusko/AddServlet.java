 package com.telusko;
 
import java.io.IOException;
import java.io.PrintWriter; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



//@WebServlet("/add") //on doing so u can remove the contents of web.xml

public class AddServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
	{
		int i= Integer.parseInt(req.getParameter("num1"));
		int j= Integer.parseInt(req.getParameter("num2"));
		
		
		int k=i+j;
		
		Cookie cookie = new Cookie("k",k + "");
		res.addCookie(cookie);
		res.sendRedirect("sq");		
	}
	
}


//res.sendRedirect("sq")
//what this will do is AddServlet will send a response to the client telling the client
//to go to second server which is Square servlet sq 

