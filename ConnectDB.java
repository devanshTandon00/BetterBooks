import java.sql.Connection;

public class ConnectDB {
	String db = "team3bookshop";
	//note that the user and password needs to be changed for different SQL Workbenches
    String user = "root";
	String password = "root";
	
	public static Connection connect() {
		try {

            java.sql.Connection con;
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // change BetterBooks in the url to name of schema to run
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/team3bookshop?serverTimezone=EST5EDT",user, password);
            
            return con;
		}
		catch(Exception e) {
			
		}
		return null;
	}
}
