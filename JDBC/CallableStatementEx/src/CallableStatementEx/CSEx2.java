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

public class CSEx2 
{
	public static void main(String[] args) throws SQLException 
	{
		try(Connection conn= TestConn.createConnection();)
		{
			CallableStatement cs= conn.prepareCall("{call getEmps(?,?)}");
			
			cs.setInt(2,200);
			cs.registerOutParameter(1,oracle.jdbc.OracleTypes.CURSOR);
			cs.execute();
			
			ResultSet s1= (ResultSet) cs.getObject(1);
			while(s1.next())
			{
				System.out.println("\nEmployee id: "+s1.getInt("eid")+"\nEmployee Name: "+s1.getString("ename")+"\nEmployee Salary: "+s1.getBigDecimal("esal")+"\n");
			}
			
			cs.close();
			conn.close();
			System.out.println("Resources are release successfully...");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}

}
}
