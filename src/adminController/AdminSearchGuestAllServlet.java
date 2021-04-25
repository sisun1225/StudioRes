package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestVO;
import model.StudioResDAO;

/**
 * Servlet implementation class AdminSearchGuestAllServlet
 */
@WebServlet("/admin/adminSearchGuestAll")
public class AdminSearchGuestAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		List<GuestVO> guestlist = dao.selectGuestsAll();
		request.setAttribute("guestlist", guestlist);		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminSearchGuestAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
