package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.ConnectDB;
import model.Book;

/**
 * Servlet implementation class DisplayItems
 */
@WebServlet("/DisplayItems")
public class DisplayItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Book> bookstore = new ArrayList<>();
	
    public DisplayItems() {
        super();
    }

	int added_cart_product = 0;
	Cookie c = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		 
		try {
			Connection con = ConnectDB.connect();
			
			String q = "select ISBN, title, year, price, first_name, last_name from books, authors\r\n"
					+ "where books.author_id = authors.author_id\r\n";
			PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            
            try {
            	c = new Cookie(request.getParameter("ItemId"), "0000000000001");
            	response.addCookie(c);
            	System.out.println("Product Added to Cart successfully!");  
            }
            catch(Exception e) {}

            while (rs.next()) 
            {
        		bookstore.add(new Book(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));  
            }
            
		}
		catch(Exception e)
		{	
			pw.print(e);
		}
		
		request.setAttribute("data", bookstore); 
		
	    request.getRequestDispatcher("/bookstorePage/bookstore.jsp").forward(request, response);     
	}
}
