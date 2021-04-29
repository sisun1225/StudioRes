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

/**
 * Servlet implementation class HostDeleteServlet
 */
@WebServlet("/host/hostDelete")
public class HostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		String host_id = request.getParameter("host_id");
		System.out.println(host_id);
		if(host_id==null||host_id=="") throw new ServletException("아이디를 찾을 수 없습니다");
		StudioResDAO dao = new StudioResDAO();
		int result = dao.deleteHost(host_id);
		System.out.println(result>0?"삭제성공":"삭제실패");
		RequestDispatcher rd = request.getRequestDispatcher("hostLogout");
		rd.forward(request, response);
	}
}
