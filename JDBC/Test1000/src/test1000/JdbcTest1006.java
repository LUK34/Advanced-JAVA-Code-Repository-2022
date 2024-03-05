package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest1006
{

	public static void main(String[] args) throws ClassNotFoundException,SQLException
	{
		Connection conn=null;
		Statement stmt=null;
		
		try
		{
			System.out.println("Connecting to Oracle database....");
			
			//DRIVER
			System.out.println("Loading the Oracle Driver....");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Oracle Driver load complete.");
			
			//CONNECTION
			System.out.println("Creating Connection.");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.101:1521:ORCL","system","mathew");		
			System.out.println("Connection established.\n");
			
			//CREATE TABLE
			System.out.println("Using connection to create statement:stmt.");
			stmt= conn.createStatement();
			System.out.println("Creating table...");
			stmt.executeUpdate("create table emp100(eid number,ename varchar2(30),esal DECIMAL(12,3) DEFAULT 0.000)");
			System.out.println("Table created SUCCESSFULLY.");
			
			// INSERTING DATA INTO THE TABLE
			System.out.println("Inserting values into the  table...");
			stmt.executeUpdate("Insert into emp100 values(111,'ratan',10000.450)");
			stmt.executeUpdate("Insert into emp100 values(112,'anu',10000.475)");
			stmt.executeUpdate("Insert into emp100 values(113,'sravya',10000.493)");
			System.out.println("Data inserted into table SUCCESSFULLY");
		
			// UPDATING DATA INTO THE TABLE
			System.out.println("Updating values into the  table with esal>10000 ...");
			stmt.executeUpdate("update emp100 set esal=esal+500 where esal>10000");
			System.out.println("Data updated into table SUCCESSFULLY");
		
			// DELETING DATA FROM TABLE
			System.out.println("Deleting values from table with esal>10000 ...");
			stmt.executeUpdate("delete from emp100 where esal>10000");
			System.out.println("Data deleted from table SUCCESSFULLY");
		
			//DROPPING THE TABLE
			System.out.println("Dropping table emp100 ...");
			stmt.executeUpdate("drop table emp100");
			System.out.println("TABLE DROPPED SUCCESSFULLY");
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
