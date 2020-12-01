package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import dao.SellerDao;
import model.Customer;
import model.Seller;

/**
 * Servlet implementation class SellerRegisterServlet
 */
@WebServlet("/registerSeller")
public class SellerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SellerDao sellerDao;
    
    
    public SellerRegisterServlet() {
        super();
    }
    
    public void init() {
  		sellerDao = new SellerDao();
  	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		Seller seller = new Seller(firstName, lastName, address);
		System.out.println("DopostActibe");
		try {
			sellerDao.registerSeller(seller);
			
			HttpSession session = request.getSession();
			session.setAttribute("username", firstName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		response.sendRedirect("landingPage/sellerLandingPage.jsp");
	}

}
