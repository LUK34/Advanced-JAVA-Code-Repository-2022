package com.trial;

import java.sql.*;

public class JdbcEx2 
{
	public static void main(String[] args) throws SQLException
	{
			//Able to access the static method createConnection from class TestConn
			Connection conn= TestConn.createConnection();
			Statement stmt= conn.createStatement();
			ResultSet set= stmt.executeQuery("select * from emp100");
			
			ResultSetMetaData metaData = set.getMetaData();
			System.out.println(metaData.getColumnCount());
			System.out.println(metaData.getColumnName(2));
			System.out.println(metaData.getColumnDisplaySize(2));
			System.out.println(metaData.getColumnTypeName(2));
			
			conn.close();
			System.out.println("Resources are released Successfully");
	}		
}
