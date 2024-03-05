package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SecondServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uqual = request.getParameter("uqual");
		String udesig = request.getParameter("udesig");
		
		Cookie ck3 = new Cookie("uqual",uqual);
		Cookie ck4 = new Cookie("udesig",udesig);
		
		response.addCookie(ck3);
		response.addCookie(ck4);
		
		request.getRequestDispatcher("form3.html").forward(request,response);
		
	}

}
