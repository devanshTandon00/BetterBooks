package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectDB;
import model.Seller;

public class SellerDao {
	public int registerSeller(Seller seller) throws ClassNotFoundException{
	    String insertSeller = "INSERT INTO sellers" +
	            "  (first_name, last_name, address) VALUES " + " (?, ?, ?);";
	    
	    int result = 0;
	    try (Connection con = ConnectDB.connect();) 
        {
        	PreparedStatement preparedStatement = con.prepareStatement(insertSeller);
            preparedStatement.setString(1, seller.getFirstName());
            preparedStatement.setString(2, seller.getLastName());
            preparedStatement.setString(3, seller.getAddress());

            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            //printSQLException(e);
        	e.printStackTrace();
        }
        return result;

	}
}
