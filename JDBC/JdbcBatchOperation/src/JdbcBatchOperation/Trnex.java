package JdbcBatchOperation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Savepoint;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Scanner;

import JdbcBatchOperation.TestConn;

public class Trnex 
{
	public static void main(String[] args) throws SQLException 
	{
		Connection conn = null;
		Statement stmt= null;
		Savepoint sv1=null;
		try
		{
			 conn= TestConn.createConnection(); 
		     stmt= conn.createStatement();
			 System.out.println("Able to access the file.properties file.\n Accessing the properties...\n");
			 conn.setAutoCommit(false);
			
			// What will happen is since AutomCommit(false) the below statements will not be updated in DB.
			//that is the operation is success but will not be updated in database.
			 stmt.executeUpdate("Insert into emp200 values(656,'ratan21',10000.456)");
			 stmt.executeUpdate("Insert into emp200 values(657,'anu22',20000.457)");
			 stmt.executeUpdate("Insert into emp200 values(658,'sravya23',30000.489)");
			 sv1=conn.setSavepoint();
			 stmt.executeUpdate("Update emp200 set esal=esal+100 where esal>10000");
			 stmt.executeUpdate("Delete from emp200 where eid==656");
			 conn.commit();
			 System.out.println("Transaction is Successfull.\n ");
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			conn.rollback(sv1);
			System.out.println("Transaction is Failed.\nIt has not been commited because ofAutoCommit(false).\n It has been rollbacked to savepoint1.\n");	
		}
		finally
		{
			if(stmt!=null) {stmt.close();}
			if(conn!=null) {conn.close();}
		}
		System.out.println("Resources are released successfully...");
	}
}
	
