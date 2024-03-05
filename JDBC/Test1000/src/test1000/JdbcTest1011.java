package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Scanner;


public class JdbcTest1011
{
	// Refer JdbcTest1010.java before refering this. Execute the JdbcTest1010.java and then execute this. 
	public static void main(String[] args) 
	{
	try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");)
	{
		
		PreparedStatement ps= conn.prepareStatement("Update emp100 set esal=esal+? where esal>?");
		ps.setDouble(1, 750);
		ps.setDouble(2, 15000.000);
		
		int x=ps.executeUpdate();
		System.out.println("updated records count.."+x);
		System.out.println("updated records are as follows.."+x);
		PreparedStatement ps2= conn.prepareStatement("select * from emp100");
		ResultSet set= ps2.executeQuery("select * from emp100");
		while(set.next())
		{
			System.out.println("\nEmployee id: "+set.getInt("eid")+"\nEmployee Name: "+set.getString("ename")+"\nEmployee Salary: "+set.getBigDecimal("esal")+"\n");
		}
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
	}
}
