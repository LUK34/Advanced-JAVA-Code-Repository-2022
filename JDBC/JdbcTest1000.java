package test1000;

import java.sql.*;

public class JdbcTest1000 
{
	public static void main(String[] args) throws ClassNotFoundException,SQLException
	{
		try
		{
			System.out.println("Connecting to Oracle database....");
			
			System.out.println("Loading the Oracle Driver....");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle Driver load complete.");
			
			System.out.println("Creating Connection.");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");		
			System.out.println("Connection established.\n");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
}
}
