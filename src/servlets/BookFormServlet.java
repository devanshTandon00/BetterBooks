package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookFormDao;
import model.Book;

/**
 * Servlet implementation class BookFormServlet
 */
@WebServlet("/bookForm")
public class BookFormServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
    private BookFormDao bookFormDao;
    
    public BookFormServlet() 
    {
        super();
    }
    
    public void init() 
    {
    	bookFormDao = new BookFormDao();
  	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ISBN = request.getParameter("ISBN");
		String title = request.getParameter("title");
		int year = Integer.parseInt(request.getParameter("year"));
		double price = Double.parseDouble(request.getParameter("price"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		Book book = new Book(ISBN, title, year, price, firstName, lastName);
		System.out.println("DopostActibe");
		try 
		{
			bookFormDao.registerBook(book);
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		response.sendRedirect("landingPage/sellerLandingPage.jsp");
	}

}
