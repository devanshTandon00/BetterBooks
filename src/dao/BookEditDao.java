package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.ConnectDB;
import model.Book;

public class BookEditDao 
{
	public int registerBook(Book book) throws ClassNotFoundException
	{
	    String updateBook = "UPDATE books SET" +
	            " ISBN = ?, " + " title = ?," + " year = ?," + " price = ?," + "author_id = ?" + 
	    		"WHERE ISBN = ?;";
	    //String insertAuthor = "INSERT INTO authors" +
	     //       "  (first_name, last_name) VALUES " + " (?, ?);";
	    //String insertInventory = "INSERT INTO inventory" +
	      //      "  (numberOfBooks,ISBN) VALUES " + " (?, ?);";
	    int result = 0;
	    //int result2 = 0;
	    //int result3 = 0;
	    try (Connection con = ConnectDB.connect();) 
        {
        	PreparedStatement preparedStatement = con.prepareStatement(updateBook);
        	preparedStatement.setString(1, book.getISBN());
        	preparedStatement.setString(2, book.getTitle());
        	preparedStatement.setInt(3, book.getYear());
        	preparedStatement.setDouble(4, book.getPrice());
        	preparedStatement.setInt(5, book.getAuthorID());

        	/*PreparedStatement preparedStatement2 = con.prepareStatement(insertAuthor);
        	preparedStatement2.setString(1, book.getFirstName());
            preparedStatement2.setString(2, book.getLastName());

        	PreparedStatement preparedStatement3 = con.prepareStatement(insertInventory);
        	preparedStatement3.setInt(1,book.getNumBooks());
        	preparedStatement3.setString(2,book.getISBN());*/
        	
            System.out.println(preparedStatement);
            result = preparedStatement.executeUpdate();
            
            /*System.out.println(preparedStatement2);
            result2 = preparedStatement2.executeUpdate();
            
            System.out.println(preparedStatement3);
            result3 = preparedStatement3.executeUpdate();*/
        } 
        catch (SQLException e) 
        {
            //printSQLException(e);
        	e.printStackTrace();
        }
        return result;

	}
}
