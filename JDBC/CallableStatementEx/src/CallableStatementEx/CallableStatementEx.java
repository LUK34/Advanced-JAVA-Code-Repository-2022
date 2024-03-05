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

public class CallableStatementEx {
	
	public static void main(String[] args) throws SQLException 
	{
	try(Connection conn= TestConn.createConnection();)
	{
		System.out.println("Able to access the file.properties file.\n Accessing the properties...\n");	
		/*
		 * CallableStatement: To execute procedure and function in oracle.
		 * In this case we are calling the procedure
		 * Here the first ? is id and the second ? is salary
		 */
		CallableStatement cs=conn.prepareCall("{call getSal(?,?)}");
		cs.setInt(1,111);
		cs.registerOutParameter(2, Types.DOUBLE);
		
		/*
		  Basically what we have to do is:
 		  	*Call the procedure using callable statement.
 			*Give the Input parameter.
 			*Register the Output parameter.
 			*Execute the procedure.
 			*Once the execution is done, the output is stored in register parameter. After that get the output. 
		 */
		
		cs.execute();
		System.out.println("Result:"+cs.getDouble(2));
		cs.close();
		System.out.println("Resoures are released successfully.");
		
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}

}
}
