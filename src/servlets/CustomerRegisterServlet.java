package servlets;

import dao.CustomerDao;
import model.Customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/registerCustomer")
public class CustomerRegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private CustomerDao customerDao;
       
    public CustomerRegisterServlet() {
        super();
    }

    public void init() {
		customerDao = new CustomerDao();
	}
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		Customer customer = new Customer(firstName, lastName, address);
		
		try {
			customerDao.registerCustomer(customer);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		response.sendRedirect("landingPage/customerLandingPage.jsp");
	}

}
