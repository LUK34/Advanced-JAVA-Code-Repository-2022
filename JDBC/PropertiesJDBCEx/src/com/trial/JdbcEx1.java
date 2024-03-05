package com.trial;

import java.sql.*;

public class JdbcEx1
{
	public static void main(String[] args) throws SQLException
	{
			//Able to access the static method createConnection from class TestConn
			Connection conn= TestConn.createConnection();
			
			//Database metadata object stores information about the database.
			// The code to access the Database metadata is as follows
			DatabaseMetaData md= conn.getMetaData();
			
			System.out.println(md.getDatabaseProductName());
			System.out.println(md.getDatabaseProductVersion());
			System.out.println(md.getUserName());
			System.out.println(md.getURL());
			System.out.println(md.getDriverName());
			
			conn.close();
			System.out.println("Resources are released Successfully");
	}
	

}
