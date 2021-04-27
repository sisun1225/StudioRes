package adminController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StudioResDAO;

/**
 * Servlet implementation class AdminStudioApproveServlet
 */
@WebServlet("/admin/adminStudioApprove")
public class AdminStudioApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		dao.updateStudioChkByNo(studio_no);
		HttpSession session = request.getSession();
		session.setAttribute("work", "approve"); 
		response.sendRedirect("adminMain");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
