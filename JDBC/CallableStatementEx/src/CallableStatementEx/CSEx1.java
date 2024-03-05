package CallableStatementEx;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.DecimalFormat;
import java.util.Scanner;

import CallableStatementEx.TestConn;

public class CSEx1 
{
  
	public static void main(String[] args) throws SQLException 
	{
		try(Connection conn= TestConn.createConnection();)
		{
			//Accessing the property file
			System.out.println("Able to access the file.properties file.\n Accessing the properties...\n");
			
			//Inserting values into table without asking user. Insertion using prepared statements and batch operation
			PreparedStatement ps2= conn.prepareStatement("Insert into emp400 values(?,?,?)");
			ps2.setInt(1,111);
			ps2.setString(2,"qwerty");
			ps2.setDouble(3,234.567);
			ps2.addBatch();
			
			ps2.setInt(1,222);
			ps2.setString(2,"awerty");
			ps2.setDouble(3,237.789);
			ps2.addBatch();
			
			ps2.setInt(1,333);
			ps2.setString(2,"swerty");
			ps2.setDouble(3,239.891);
			ps2.addBatch();
			
			ps2.setInt(1,444);
			ps2.setString(2,"dwerty");
			ps2.setDouble(3,241.789);
			ps2.addBatch();
			
			ps2.setInt(1,555);
			ps2.setString(2,"fwerty");
			ps2.setDouble(3,256.791);
			ps2.addBatch();
			
			ps2.executeBatch();
			System.out.println("Insertion Successfull\n");
			System.out.println("After insertion the records are as follows..");
			PreparedStatement ps3= conn.prepareStatement("select * from emp400");
			ResultSet s1= ps3.executeQuery("select * from emp400");
			while(s1.next())
			{
				System.out.println("\nEmployee id: "+s1.getInt("eid")+"\nEmployee Name: "+s1.getString("ename")+"\nEmployee Salary: "+s1.getBigDecimal("esal")+"\n");
			}
			
			//Updation using prepared statements and batch operation
			PreparedStatement ps4= conn.prepareStatement("Update emp400 set esal=esal+500 where eid=? ");
			ps4.setInt(1,333);
			ps4.addBatch();
			
			ps4.setInt(1,444);
			ps4.addBatch();
			
			ps4.setInt(1,555);
			ps4.addBatch();
			
			ps4.executeBatch();
			System.out.println("Updation Successfull\n");
			System.out.println("After updation the records are as follows..");
			PreparedStatement ps5= conn.prepareStatement("select * from emp400");
			ResultSet s2= ps5.executeQuery("select * from emp400");
			while(s2.next())
			{
				System.out.println("\nEmployee id: "+s2.getInt("eid")+"\nEmployee Name: "+s2.getString("ename")+"\nEmployee Salary: "+s2.getBigDecimal("esal")+"\n");
			}
			
			// Display user details having highest salary.
			PreparedStatement ps6= conn.prepareStatement("select * from emp400 where esal=(select max(esal) from emp400)");
			ResultSet s3= ps5.executeQuery("select * from emp400 where esal=(select max(esal) from emp400)");
			System.out.println("Details of employee having highest salary.");
			while(s3.next())
			{
				System.out.println("\nEmployee id: "+s3.getInt("eid")+"\nEmployee Name: "+s3.getString("ename")+"\nEmployee Salary: "+s3.getBigDecimal("esal")+"\n");
			}
			
			// Display user details having lowest salary.
			PreparedStatement ps7= conn.prepareStatement("select * from emp400 where esal=(select min(esal) from emp400)");
			ResultSet s4= ps5.executeQuery("select * from emp400 where esal=(select min(esal) from emp400)");
			System.out.println("Details of employee having lowest salary.");
			while(s4.next())
			{
				System.out.println("\nEmployee id: "+s4.getInt("eid")+"\nEmployee Name: "+s4.getString("ename")+"\nEmployee Salary: "+s4.getBigDecimal("esal")+"\n");
			}
			
			//Calling AVG of 2 employees using procedure. 
			CallableStatement cs=conn.prepareCall("{call get_avg(?,?,?)}");
			cs.setInt(1,111);
			cs.setInt(2,222);
			cs.registerOutParameter(3, Types.DOUBLE);
			cs.execute();
			System.out.println("Average salary of the 2 employees is: "+cs.getDouble(3));
			cs.close();
			
			//Calling INSERTION using procedure
			CallableStatement cs1=conn.prepareCall("{call get_insert(?,?,?)}");
			cs1.setInt(1,888);
			cs1.setString(2,"lwerty");
			cs1.setDouble(3,300.259);
			cs1.execute();
			System.out.println("insertion using procedure complete.");
			PreparedStatement ps8= conn.prepareStatement("select * from emp400");
			ResultSet s5= ps8.executeQuery("select * from emp400");
			while(s5.next())
			{
				System.out.println("\nEmployee id: "+s5.getInt("eid")+"\nEmployee Name: "+s5.getString("ename")+"\nEmployee Salary: "+s5.getBigDecimal("esal")+"\n");
			}
			cs1.close();
			
			//Calling SELECT using procedure
			CallableStatement cs2=conn.prepareCall("{call get_details(?,?,?,?)}");
			cs2.setInt(1,888);
			cs2.registerOutParameter(2, Types.INTEGER);
			cs2.registerOutParameter(3, Types.VARCHAR);
			cs2.registerOutParameter(4, Types.DOUBLE);
			cs2.execute();
			System.out.println(cs2.getInt(2));
			System.out.println(cs2.getString(3));
			System.out.println(cs2.getDouble(4));
			System.out.println("Operations are completed.");
			cs1.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	
	}
		
}
/*
 create table emp400(eid number,ename varchar2(30),esal number(14,3));

Create or replace procedure get_avg(id1 IN number, id2 IN number, sal OUT number) as 
BEGIN 
select avg(esal) into sal from emp400 where eid in (id1,id2); 
END get_avg; 
/
Create or replace procedure get_insert(id1 IN number, str1 IN varchar2, sal IN number) as 
BEGIN 
Insert into emp400 values(id1,str1,sal);
END get_insert; 
/

Create or replace procedure get_details(id1 IN number, o1 OUT number, o2 OUT varchar, o3 OUT number) as 
BEGIN 
select eid,ename,esal into o1,o2,o3 from emp400 where eid=id1;
END get_details; 
/

create or replace function getAvg(id1 IN number, id2 IN number) return number
as
sal1 number;
sal2 number;
BEGIN
select esal into sal1 from emp400 where eid=id1;
select esal into sal2 from emp400 where eid=id2;
return (sal1+sal2)/2;
END getAvg;
/

drop function getAvg;
drop procedure get_details;
drop procedure get_insert;
drop procedure get_avg;
drop table emp400;
 
 */