package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/admin/adminLoginChk")
public class AdminLoginChkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("adminid") != null) {
			response.sendRedirect("adminMain");
			return;
		}
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminLoginChk.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminid = request.getParameter("adminid");
		String adminpw = request.getParameter("adminpw");
		
		if(adminid.equals("admin") && adminpw.equals("1234")) {
			HttpSession session = request.getSession();
			session.setAttribute("adminid", adminid);
			response.sendRedirect("adminMain");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("adminLoginChk.jsp");
		rd.forward(request, response);
		return;
	}

}
