package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class AdminHostDetailServlet
 */
@WebServlet("/admin/adminHostDetail")
public class AdminHostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		String host_id = request.getParameter("host_id");
		List<StudioVO> studiolist = dao.selectStudioByHostId(host_id);
		request.setAttribute("studiolist", studiolist);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminHostDetail.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
