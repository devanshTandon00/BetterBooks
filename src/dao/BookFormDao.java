package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectDB;
import model.Book;

public class BookFormDao 
{
	public int registerBook(Book book) throws ClassNotFoundException
	{
	    String insertBook = "INSERT INTO books" +
	            "  (ISBN, title, year, price) VALUES " + " (?, ?, ?, ?);";
	    String insertAuthor = "INSERT INTO authors" +
	            "  (first_name, last_name) VALUES " + " (?, ?);";
	    int result = 0;
	    int result2 = 0;
	    try (Connection con = ConnectDB.connect();) 
        {
        	PreparedStatement preparedStatement = con.prepareStatement(insertBook);
        	preparedStatement.setString(1, book.getISBN());
        	preparedStatement.setString(2, book.getTitle());
        	preparedStatement.setInt(3, book.getYear());
        	preparedStatement.setDouble(4, book.getPrice());
        	PreparedStatement preparedStatement2 = con.prepareStatement(insertAuthor);
        	preparedStatement2.setString(1, book.getFirstName());
            preparedStatement2.setString(2, book.getLastName());

            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
            System.out.println(preparedStatement2);
            result2 = preparedStatement2.executeUpdate();
        } 
        catch (SQLException e) 
        {
            //printSQLException(e);
        	e.printStackTrace();
        }
        return result;

	}
}
