package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookEditDao;
import model.Book;

/**
 * Servlet implementation class BookFormServlet
 */
@WebServlet("/bookEdit")
public class BookEditServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
    private BookEditDao bookEditDao;
    
    public BookEditServlet() 
    {
        super();
    }
    
    public void init() 
    {
    	bookEditDao = new BookEditDao();
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
		int authorID = Integer.parseInt(request.getParameter("authorID"));
		int numOfBooks = Integer.parseInt(request.getParameter("numBooks"));

		Book book = new Book(ISBN, title, year, price, firstName, lastName, authorID, numOfBooks);
		System.out.println("DopostActibe");
		try 
		{
			bookEditDao.editBook(book);
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		response.sendRedirect("inventoryPage/sellerInventory.jsp");
	}

}
