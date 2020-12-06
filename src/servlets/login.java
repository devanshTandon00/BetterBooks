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
		
		try {
			if (loginDao.validate(firstName, lastName)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", firstName);
				
				String userType = loginDao.getLoginType(firstName);
				System.out.println(userType);
				if (userType.equals("Customer")) {
					response.sendRedirect("landingPage/customerLandingPage.jsp");
				} 
				else if(userType.equals("Admin")) {
					response.sendRedirect("landingPage/adminLandingPage.jsp");
				}
				else {
					response.sendRedirect("landingPage/sellerLandingPage.jsp");
				}
			} else {
				response.sendRedirect("loginPage/login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
