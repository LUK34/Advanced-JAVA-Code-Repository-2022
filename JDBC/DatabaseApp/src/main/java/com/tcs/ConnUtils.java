package com.tcs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.dbcp.BasicDataSource;


public class ConnUtils {
	static BasicDataSource ds =null;
	
	static {
		ds=new BasicDataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@192.168.1.107:1521:ORCL");
		ds.setUsername("system");
		ds.setPassword("mathew");
		ds.setMaxActive(10);
		
	}
	
}