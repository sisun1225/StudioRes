package hostController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.HostVO;
import model.StudioResDAO;

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
		RequestDispatcher rd = request.getRequestDispatcher("hostLogin.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		
		String host_id = request.getParameter("host_id");
		String host_pw = request.getParameter("host_pw");
		HostVO host = dao.selectHostById(host_id);
		HttpSession session = request.getSession();
		if(host_pw.equals(host.getHost_pw())) {
			session.setAttribute("host_id", host_id);
			session.setAttribute("host_pw", host_pw);
			session.setAttribute("host_name",host.getHost_name());
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("loginForm.html");
			rd.forward(request, response);
		}
		
		
		
		
	}
}
