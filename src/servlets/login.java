package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDao;
import model.Customer;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private LoginDao loginDao;
    
    public login() {
        super();
    }
    
    public void init() {
		loginDao = new LoginDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("username");
		String lastName= request.getParameter("password");
		Customer customer = new Customer(firstName, lastName);
		
		try {
			if (loginDao.validate(customer)) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", firstName);
				
				String userType = loginDao.getLoginType(firstName);
				System.out.println(userType);
				if (userType.equals("Customer")) {
					response.sendRedirect("landingPage/customerLandingPage.jsp");
				} 
//				else if (userType.equals("Operator")) {
//					response.sendRedirect("Dashboards/operatorDashboard.jsp");
//				} else {
//					response.sendRedirect("Dashboards/customerDashboard.jsp");
//				}
			} else {
				response.sendRedirect("loginPage/login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
