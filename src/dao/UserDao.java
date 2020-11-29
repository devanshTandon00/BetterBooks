package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import connection.ConnectDB;
//import model.User;

public class UserDao 
{
	public int registerEmployee(User employee) throws ClassNotFoundException 
	{
        String INSERT_USERS_SQL = "INSERT INTO employee" +
            "  (first_name, last_name, username, password, address, contact) VALUES " +
            " ( ?, ?, ?, ?,?,?);";

        int result = 0;

                try (Connection con = ConnectDB.connect(); 
                		PreparedStatement preparedStatement = con.prepareStatement(INSERT_USERS_SQL)) 
                {
                	preparedStatement.setInt(1, 2);
                    preparedStatement.setString(1, employee.getFirstName());
                    preparedStatement.setString(2, employee.getLastName());
                    preparedStatement.setString(3, employee.getUsername());
                    preparedStatement.setString(4, employee.getPassword());
                    preparedStatement.setString(5, employee.getAddress());
                    preparedStatement.setString(6, employee.getContact());

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