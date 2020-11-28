package servlets;
import java.io.IOException;
import java.io.Serializable;
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
 * Servlet implementation class ViewCartItems
 */
@WebServlet("/ViewCartItems")
public class ViewCartItems extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public ViewCartItems() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		ArrayList<Book> bookList = new ArrayList<>();
		
		Connection con = ConnectDB.connect();
		
		String q;
		PreparedStatement pst;
        ResultSet rs;
        
        try {
        	Cookie c = new Cookie(request.getParameter("ItemId"), "0000000000001");
        	c.setMaxAge(0);
        	response.addCookie(c);
        	System.out.println("REmoved cookies");
        }
        catch(Exception e) {}
                
        try {
        	Cookie ck[] = request.getCookies();
        	System.out.println(ck.length);
        	for(int i = 1; i < ck.length;i++) {
          		q = "select * from books where ISBN = " + ck[i].getName();
        		pst = con.prepareStatement(q);
        		rs = pst.executeQuery();
        		               
        		
        		while (rs.next()) 
                {
        			bookList.add(new Book(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4)));  
                }
              
        	}
        }
        catch(Exception e) {
        	
        }
        	request.setAttribute("data", bookList); 
	
	       request.getRequestDispatcher("/shoppingCart/shoppingCart.jsp").forward(request, response);
	}
}
