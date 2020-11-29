package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import connection.ConnectDB;
//import model.User;
import model.Customer;

public class CustomerDao 
{
	public int registerCustomer(Customer customer) throws ClassNotFoundException 
	{
        String insertCustomer = "INSERT INTO customer" +
            "  (first_name, last_name, address) VALUES " + " (?, ?, ?);";

        int result = 0;

                try (Connection con = ConnectDB.connect();) 
                {
                	PreparedStatement preparedStatement = con.prepareStatement(insertCustomer);
                    preparedStatement.setString(1, customer.getFirstName());
                    preparedStatement.setString(2, customer.getLastName());
                    preparedStatement.setString(3, customer.getAddress());

                    System.out.println(preparedStatement);
                    result = preparedStatement.executeUpdate();
                } 
                catch (SQLException e) 
                {
                	e.printStackTrace();
                }
                return result;
            }
        }