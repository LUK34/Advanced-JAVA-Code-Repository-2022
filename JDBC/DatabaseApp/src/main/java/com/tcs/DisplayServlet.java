package com.tcs;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DisplayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		
		try
		{
			/*
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");
			*/
			
			//The below code i connection pooling using 3rd party resource.
			Connection conn= ConnUtils.ds.getConnection();
			
			Statement st=conn.createStatement();
			ResultSet set= st.executeQuery("select * from customer100");
			pw.println("<b><p>FirstName LastName Email Mobile Address</p></b>");
			while(set.next())
			{
				pw.println(set.getString(1)+"    "+set.getString(2)+"    "+set.getString(3)+"    "+set.getString(4)+"    "+set.getString(5));
			    pw.println("<br>");
			}
			pw.println("<a href='customer.html'>Click here to add a new record</a>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		} 
	}
}
