package hostController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StudioResDAO;
import model.StudioVO;


@WebServlet("/host/hostUpdateStudio")
public class HostUpdateStudioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		StudioResDAO dao = new StudioResDAO();
		StudioVO studio =  dao.selectStudioByNo(studio_no);
		request.setAttribute("studio", studio);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("hostUpdateStudio.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
