package com.tcs;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;



public class CustomerServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public CustomerServlet()
    {
        // TODO Auto-generated constructor stub
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		response.setContentType("text/html");
		PrintWriter pw= response.getWriter();
		
		String firstname = request.getParameter("firstName");
		String lastname = request.getParameter("lastName");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		
		// We are storing the address data in array list
		String[] addr=request.getParameterValues("t1");
		//Initializing the variable bf of type StringBuffer
		StringBuffer bf=new StringBuffer();
		for(String data: addr)
		{
			bf.append(data+",");
			//The data will be appended and will be stored in bf
		}
		
		String caddr= bf.toString();
		try
		{
			/*
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");
			*/
			
			
			//The below code i connection pooling using 3rd party resource.
			//Connection conn= ConnUtils.ds.getConnection();
			
			Context initContext=new InitialContext();
			DataSource ds=(DataSource)initContext.lookup("java:/comp/env/mypool");
			Connection conn=ds.getConnection();
			
			PreparedStatement ps=conn.prepareStatement("insert into customer100 values(?,?,?,?,?)");
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ps.setString(3, email);
			ps.setString(4, mobile);
			ps.setString(5, caddr);
			
			int a=ps.executeUpdate();
			if(a==1)
			{
				pw.println("Data is inserted Successfully....");
				pw.println("<a href='DisplayServlet'>Click here to display all records..</a>");
			}
			else
			{
				pw.println("Data is not inserted Successfully.Please check logic.");	 
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		} 
		
	}
}
