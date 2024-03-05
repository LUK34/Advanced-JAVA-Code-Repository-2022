package com.tcs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListner implements ServletContextListener {
	
    public MyListner() {
        
    }

	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("contextDestroyed method Connection closing.");
		/*
		  ContextDestroyer: This is executed when we stop the server.
		   
		  Here what we do is we get the database connection from servlet context object and closing the connection
		  */
	
		ServletContext context= sce.getServletContext();
		Connection conn= (Connection) context.getAttribute("conn");
		try {
			conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("contextInitialsized method Connection creation.");
		try
		{
			
			/*
			 ContextInitalizer: This is executed when we start the server. 
			 
			 The context object scope is use to use the data base connection throught the entire application.
			 We store teh data base connection into context object.
			  */
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");
			ServletContext context= sce.getServletContext();
			context.setAttribute("conn",conn);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
    
    
}
