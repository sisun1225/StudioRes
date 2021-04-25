package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationsVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class AdminSearchStudioAllServlet
 */
@WebServlet("/admin/adminSearchStudioAll")
public class AdminSearchStudioAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		List<StudioVO> studiolist = dao.selectStudiosAll();
		request.setAttribute("studiolist", studiolist);	
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminSearchStudioAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
