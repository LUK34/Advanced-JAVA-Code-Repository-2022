package JdbcBatchOperation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Scanner;

import JdbcBatchOperation.TestConn;

public class Batch1000 {
	public static void main(String[] args) throws SQLException 
	{
	try(Connection conn= TestConn.createConnection();)
	{
		System.out.println("Able to access the file.properties file.\n Accessing the properties...\n");
		Statement stmt=conn.createStatement();
		stmt.addBatch("Create table emp200(eid number,ename varchar2(30),esal number(14,3))");
		System.out.println("Table created\n");
		stmt.addBatch("Insert into emp200 values(111,'ratan1',11234.567)");
		stmt.addBatch("Insert into emp200 values(222,'ratan2',10247.563)");
		stmt.addBatch("Insert into emp200 values(333,'ratan3',12345.569)");
		System.out.println("Insertion Successfull\n");
		stmt.addBatch("Update emp200 set esal=esal+500 where esal>10000");
		System.out.println("Updation Successfull\n");
		//stmt.addBatch("Drop table emp200");
		//System.out.println("Table dropped Successfull\n");
		int[] a= stmt.executeBatch();
		for(int x:a) 
		{
			System.out.println(x);
		}
		
		stmt.close();
		System.out.println("Resources are released Successfully");
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
}
}
