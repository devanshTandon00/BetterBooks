import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DisplayItems
 */
@WebServlet("/DisplayItems")
public class DisplayItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisplayItems() {
        super();
    }

	int added_cart_product = 0;
	Cookie c = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		try {
			Connection con = ConnectDB.connect();
			
			String q = "select * from books";
			PreparedStatement pst = con.prepareStatement(q);
            ResultSet rs = pst.executeQuery();
            
            try {
            	c = new Cookie(request.getParameter("ItemId"), "0000000000001");
            	response.addCookie(c);
            	pw.print("Product Added to Cart successfully!");            	
            }
            catch(Exception e) {}
            
            pw.print("<a href = 'ViewCartItems'>View Cart</a>");
            
            pw.print(
            		"<table cellpadding = \"20\">\r\n"
            		+ "            <tr>\r\n"
            		+ "					<td>ISBN</td>\r\n"
            		+ "					<td>Title</td>\r\n"
            		+ "					<td>Year</td>\r\n"
            		+ "					<td>Price</td>\r\n"
            		+ "			</tr>"
            );

            while (rs.next()) 
            {	
            	pw.print("<tr>\r\n"
            			+ "		            	<td>" + rs.getString(1) + "</td>\r\n"
            			+ "		            	<td>" + rs.getString(2)+ "</td>\r\n"
            			+ "		            	<td>" + rs.getInt(3) + "</td>\r\n"
            			+ "		            	<td>" + rs.getInt(4)+ "</td>\r\n"
            			+"						<td><a href = 'DisplayItems?ItemId="+ rs.getString(1) + "'>Add To Cart </a></td>"
            			+ "	            	</tr><br>"
            			);
            }
            pw.print("</table></body></html>");
            
		}
		catch(Exception e)
		{	
			pw.print(e);
		}
	}

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}

}
