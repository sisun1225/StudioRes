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
 * Servlet implementation class HostUpdateServlet
 */
@WebServlet("/host/hostUpdate")
public class HostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		StudioResDAO dao = new StudioResDAO();
		String host_id = (String)session.getAttribute("host_id");
		HostVO host = dao.selectHostById(host_id);
		request.setAttribute("host", host);
		RequestDispatcher rd = request.getRequestDispatcher("hostUpdate.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		HostVO host = new HostVO();
		
		host.setHost_id(request.getParameter("host_id"));
		host.setHost_pw(request.getParameter("host_pw"));
		host.setHost_name(request.getParameter("host_name"));
		host.setHost_phone(request.getParameter("host_phone"));
		host.setHost_email(request.getParameter("host_email"));
		int result = dao.updateHost(host);
		HttpSession session = request.getSession();
		session.removeAttribute("host_pw");
		session.setAttribute("host_pw", host.getHost_pw());
		session.removeAttribute("host_name");
		session.setAttribute("host_name",host.getHost_name());
		//System.out.println(result>0?"수정성공":"수정실패");
		RequestDispatcher rd = request.getRequestDispatcher("hostDetail");
		rd.forward(request, response);
	}
}
