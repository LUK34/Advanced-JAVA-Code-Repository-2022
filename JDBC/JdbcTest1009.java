package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Scanner;


public class JdbcTest1009 {

	public static void main(String[] args) 
	{
		//Benefit of placing the driver and connection in try block  for java version that >7
		// is that it will AUTOMATICALLY CLOSE
		
		try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");
			Statement stmt= conn.createStatement();)
		{
			
			System.out.println("Creating table...");
			stmt.executeUpdate("create table emp100(eid number,ename varchar2(30),esal number(14,3))");
			System.out.println("Table created SUCCESSFULLY.");

			Scanner sc = new Scanner(System.in);
			
			while(true)
			{
				System.out.println("Enter emp id:\n");
				int eid = sc.nextInt();
				
				System.out.println("Enter emp name:\n");
				String ename = sc.next();
				
				System.out.println("Enter emp salary:\n");
				Double esal=sc.nextDouble();
				
				stmt.executeUpdate("Insert into emp100 values("+eid+",'"+ename+"',"+esal+")");
				System.out.println("Inserting.... \n\nData is as follows:");
				ResultSet set= stmt.executeQuery("select * from emp100");
				while(set.next())
				{
					System.out.println(set.getInt("eid")+" "+set.getString("ename")+" "+set.getBigDecimal("esal")+" ");
				}
				System.out.println("Data inserted into table SUCCESSFULLY. Do u want to continue (Y/N)??");
				String op=sc.next();
				if(op.equals("N")||op.equals("n"))
				{
					break;
				}
			}
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
}
}
