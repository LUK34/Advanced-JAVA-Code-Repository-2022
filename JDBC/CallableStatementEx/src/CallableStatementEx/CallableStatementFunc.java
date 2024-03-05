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

public class CallableStatementFunc 
{

	public static void main(String[] args) throws SQLException 
	{
		try(Connection conn= TestConn.createConnection();)
		{
			CallableStatement cs= conn.prepareCall("{?=call getAvg(?,?)}");
			
			//The first qstmark is the output. Hence we calling the first qstmark last
			cs.setInt(2,111);
			cs.setInt(3,222);
			cs.registerOutParameter(1,Types.DOUBLE);
			cs.execute();
			
			System.out.println("Result:"+cs.getDouble(1));
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
