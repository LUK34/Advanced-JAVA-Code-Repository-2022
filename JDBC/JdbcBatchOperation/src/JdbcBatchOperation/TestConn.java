package JdbcBatchOperation;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


public class TestConn
{
	public static Connection createConnection()
	{
		Connection conn=null;
		try 
		{
			//Load the properties file
			Properties properties = new Properties();
			properties.load(new FileInputStream("file.properties"));
			
			//read the data from properties file
			Class.forName(properties.getProperty("driver"));		
			conn=DriverManager.getConnection(
											  properties.getProperty("url"),
				                              properties.getProperty("username"),
				                              properties.getProperty("password")
				                             );
			
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return conn;
		
	}
}
