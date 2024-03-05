package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest1002
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
			System.out.println("Inserting values into the  table...");
			stmt.executeUpdate("Insert into emp100 values(111,'ratan',10000.450)");
			stmt.executeUpdate("Insert into emp100 values(112,'anu',10000.475)");
			stmt.executeUpdate("Insert into emp100 values(113,'sravya',10000.493)");
			System.out.println("Data inserted into table SUCCESSFULLY");
			
		}
		/*catch(Exception e)
		{
			e.printStackTrace();
		}*/
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
