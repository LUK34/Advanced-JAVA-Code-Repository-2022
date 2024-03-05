package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType ("text /html");
		PrintWriter pw = response.getWriter();
		String tname=request.getParameter("tname");
		/*
		 *Using the request parameter of doGet method method. we will take the request parameter and place it in context object
		 *Using the context object we will call the database connection variable "conn" that has the database access fields.
		 *
		 */
		ServletContext context= request.getServletContext();
		Connection conn= (Connection) context.getAttribute("conn");
		
		try 
		{
			Statement stmt=conn.createStatement();
			ResultSet set=stmt.executeQuery("select * from"+tname);
			
			while(set.next())
			{
				pw.println(set.getInt(1)+"---"+set.getString(2)+"---"+set.getDouble(3));
				pw.println("<br><br>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
