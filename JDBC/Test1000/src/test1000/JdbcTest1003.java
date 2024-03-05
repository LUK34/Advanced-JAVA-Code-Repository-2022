package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest1003 
{
	public static void main(String[] args) throws ClassNotFoundException,SQLException
	{
	Connection conn=null;
	Statement stmt=null;
	
	try
	{
		System.out.println("Connecting to Oracle database....");
		
		System.out.println("Loading the Oracle Driver....");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Oracle Driver load complete.");
		
		System.out.println("Creating Connection.");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");		
		System.out.println("Connection established.\n");
		
		System.out.println("Using connection to create statement:stmt.");
		stmt= conn.createStatement();
		System.out.println("Updating values into the  table with esal>10000 ...");
		stmt.executeUpdate("update emp100 set esal=esal+500 where esal>10000");
		System.out.println("Data updated into table SUCCESSFULLY");
	}
	catch(ClassNotFoundException f)
	{
		f.printStackTrace();
	}
	catch(SQLException g)
	{
		g.printStackTrace();
	}
	finally
	{
		try 
		{
			if(stmt!=null)
			{
				System.out.println("Closing the stmt.");
				stmt.close();
				System.out.println("stmt closed SUCCESSFULLY.");
			}
			if(conn!=null)
			{
				System.out.println("Closing the Connection.");
				System.out.println("Connection closed SUCCESSFULLY.");
				conn.close();
			}
		}
		catch(SQLException g)
		{
			g.printStackTrace();
		}
	}

}
}
