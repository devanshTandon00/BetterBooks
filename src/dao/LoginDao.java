package dao;

import model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.ConnectDB;

public class LoginDao {
	public boolean validate(String firstName, String lastName) throws ClassNotFoundException, SQLException {
		boolean status = false;

		try (Connection con = ConnectDB.connect();) {
			PreparedStatement preparedStatement =
					con.prepareStatement("select * from team3bookshop.customer where first_name = ? and last_name = ? ");
			
			preparedStatement.setString(1, firstName);
			preparedStatement.setString(2, lastName);

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();
			
			if(!status) {
				PreparedStatement preparedStatement2 =
						con.prepareStatement("select * from team3bookshop.sellers where first_name = ? and last_name = ? ");
				
				preparedStatement2.setString(1, firstName);
				preparedStatement2.setString(2, lastName);

				System.out.println(preparedStatement2);
				ResultSet rs1 = preparedStatement2.executeQuery();
				status = rs1.next();
			}
			
			System.out.println(status);
		}
		catch(Exception e) {
			
		}
		return status;
	}
	
	public static int getID(String firstName) throws ClassNotFoundException {
		String idQuery = "SELECT account_id from team3bookshop.customer where first_name = ?";

		int id = 0;

		try (Connection connection = ConnectDB.connect()) {

			PreparedStatement preparedStatement1 = connection.prepareStatement(idQuery);
			preparedStatement1.setString(1, firstName);
			ResultSet rs = preparedStatement1.executeQuery();
			rs.next();
			id = rs.getInt(1);

		} catch (SQLException e) {

		}
		return id;
	}

	
	public String getLoginType(String firstName) throws ClassNotFoundException, SQLException {
		String type = null;
		try (Connection con = ConnectDB.connect();) {
			int id = getID(firstName);
			PreparedStatement checkOwner = con
					.prepareStatement("SELECT * FROM team3bookshop.customer WHERE account_id = ?");
			checkOwner.setInt(1, id);
			ResultSet rs = checkOwner.executeQuery();
			if (rs.next()) {
				type = "Customer";
			} 
			else {
				type = "Seller";
			}
		}
		return type;
	}
}
