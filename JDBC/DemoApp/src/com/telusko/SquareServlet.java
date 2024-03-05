package com.telusko;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sq")
public class SquareServlet extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		int k=0;
		Cookie cookies[] = req.getCookies();
		
		for(Cookie c : cookies)
		{
			if(c.getName().equals("k"))
				k = Integer.parseInt(c.getValue());
		}
		k=k*k;
		PrintWriter out = res.getWriter();
		out.println("Result is " + k);
	}
}

/*
 So S2 has to accept the cookies,here there is no req.
 getCookie() but has req.getCookies() that means client is sending 
 all the cookie even the cookies that he doesnt need and will ask S2
 to process to figure it out.so to lighten the process for S2 to figure 
 it out we getCookies(0 using array
 */
 