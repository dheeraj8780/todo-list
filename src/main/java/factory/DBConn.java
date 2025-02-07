package factory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	static Connection con;
	public static Connection getConn(){
		try {
			if(con==null) {
				// load JDBC driver
				Class.forName("oracle.jdbc.driver.OracleDriver");
				// establish Connection
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "sub1", "sub1");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
