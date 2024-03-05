package com.tcs;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class LoginListner implements HttpSessionListener {
	
    public LoginListner() {
        // TODO Auto-generated constructor stub
    }

    int total;
    int current;
    ServletContext ctx=null;
	public void sessionCreated(HttpSessionEvent se)
	{
		System.out.println("Session object created with id:"+se.getSession().getId());
		total++;
		current++;
		ctx = se.getSession().getServletContext();
		ctx.setAttribute("totalusers",total);
		ctx.setAttribute("currentusers",current);
	}

	public void sessionDestroyed(HttpSessionEvent se) 
	{
		System.out.println("Session object destroyed with id:"+se.getSession().getId());
		current--;
		ctx.setAttribute("currentusers",current);
	}
    
    
	
}
