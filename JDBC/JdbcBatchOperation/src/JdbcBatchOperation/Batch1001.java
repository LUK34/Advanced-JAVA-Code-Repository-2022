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

public class Batch1001 {
	public static void main(String[] args) throws SQLException 
	{
	try(Connection conn= TestConn.createConnection();)
	{
		System.out.println("Able to access the file.properties file.\n Accessing the properties...\n");
		PreparedStatement ps= conn.prepareStatement("Update emp200 set ename=? where eid=? ");
		ps.setString(1,"ratan8");
		ps.setInt(2,111);
		ps.addBatch();
		
		ps.setString(1,"ratan9");
		ps.setInt(2,222);
		ps.addBatch();
		
		ps.setString(1,"ratan10");
		ps.setInt(2,333);
		ps.addBatch();
		
		ps.executeBatch();
		
		ps.close();
		System.out.println("Resources are released Successfully");
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
}
}
