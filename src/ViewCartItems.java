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
 * Servlet implementation class ViewCartItems
 */
@WebServlet("/ViewCartItems")
public class ViewCartItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewCartItems() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		Connection con = ConnectDB.connect();
		
		String q;
		PreparedStatement pst;
        ResultSet rs;
        
        try {
        	Cookie c = new Cookie(request.getParameter("ItemId"), "0000000000001");
        	c.setMaxAge(0);
        	response.addCookie(c);
        	pw.print("Product Removed from Cart successfully!");            	
        }
        catch(Exception e) {}
        
        pw.print("<a href = 'DisplayItems'>Go Back</a>");
        
        try {
        	Cookie ck[] = request.getCookies();
        	
        	pw.print(
        			"<table cellpadding = \"20\">\r\n"
                    		+ "            <tr>\r\n"
                    		+ "					<td>ISBN</td>\r\n"
                    		+ "					<td>Title</td>\r\n"
                    		+ "					<td>Year</td>\r\n"
                    		+ "					<td>Price</td>\r\n"
                    		+ "			</tr>"
        			);
        	
        	
        	for(int i = 1; i < ck.length;i++) {
            			
        		pw.print(ck[i].getName()+ "!!!!!" + ck[i].getValue());
        		
          		q = "select * from books where ISBN =" + ck[i].getName();
        		pst = con.prepareStatement(q);
        		rs = pst.executeQuery();
        		        		 
                while (rs.next()) 
                {
                	pw.print("<tr>\r\n"
                			+ "		            	<td>" + rs.getString(1) + "</td>\r\n"
                			+ "		            	<td>" + rs.getString(2)+ "</td>\r\n"
                			+ "		            	<td>" + rs.getInt(3) + "</td>\r\n"
                			+ "		            	<td>" + rs.getInt(4)+ "</td>\r\n"
                			+"						<td><a href = 'ViewCartItems?ItemId="+ rs.getString(1) + "'>Remove from Cart </a></td>"			
                			+ "	            	</tr><br>"
                			);
                }
              
        	}
        	
        	  pw.print("</table></body></html>");
        }
        catch(Exception e) {
        	
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
