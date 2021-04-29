package hostController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HostVO;
import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class HostLoginServlet
 */
@WebServlet("/host/hostLogin")
public class HostLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String page = "hostLogin.jsp";
		if(session.getAttribute("host_id")!=null) {
			page = "hostMain.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		
		String host_id = request.getParameter("host_id");
		String host_pw = request.getParameter("host_pw");
		HostVO host = dao.loginChk(host_id,host_pw);
		
		HttpSession session = request.getSession();
		if(host != null) {
			session.setAttribute("host_no", host.getHost_no());
			session.setAttribute("host_id", host.getHost_id());
			session.setAttribute("host_pw", host.getHost_pw());
			session.setAttribute("host_name",host.getHost_name());
			List<StudioVO> studiolist = dao.selectStudioByHostId(host_id);
			session.setAttribute("studiolist", studiolist);	
			RequestDispatcher rd;
			response.sendRedirect("hostMain");
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("hostLogin.jsp");
		rd.forward(request, response);
		return;
	}
}
