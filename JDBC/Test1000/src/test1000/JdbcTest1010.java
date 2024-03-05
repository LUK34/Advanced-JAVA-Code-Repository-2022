package test1000;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.Scanner;

public class JdbcTest1010 
{
	public static void main(String[] args) 
	{
	try(Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.107:1521:ORCL","system","mathew");)
		{
			
			System.out.println("Creating table...");
			PreparedStatement ps= conn.prepareStatement("create table emp100(eid number,ename varchar2(30),esal number(14,3))");
			ps.executeUpdate();
			System.out.println("Table created SUCCESSFULLY.");

			// PREPARED STATEMENTS
			PreparedStatement ps1= conn.prepareStatement("Insert into emp100 values(?,?,?)");
			Scanner sc = new Scanner(System.in);
			
			while(true)
			{
				System.out.println("Enter emp id:\n");
				int eid = sc.nextInt();
				
				System.out.println("Enter emp name:\n");
				String ename = sc.next();
				
				System.out.println("Enter emp salary:\n");
				Double esal=sc.nextDouble();
				
				ps1.setInt(1, eid);
				ps1.setString(2, ename);
				ps1.setDouble(3,esal);
				
				ps1.executeUpdate();
				
				System.out.println("Inserting.... \n\nData is as follows:");
				PreparedStatement ps2= conn.prepareStatement("select * from emp100");
				ResultSet set= ps2.executeQuery("select * from emp100");
				while(set.next())
				{
					System.out.println("\nEmployee id: "+set.getInt("eid")+"\nEmployee Name: "+set.getString("ename")+"\nEmployee Salary: "+set.getBigDecimal("esal")+"\n");
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
