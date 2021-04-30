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

import model.StudioResDAO;
import model.StudioVO;

/**
 * Servlet implementation class HostMainServlet
 */
@WebServlet("/host/hostMain")
public class HostMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션삭제
		HttpSession session = request.getSession();
		session.removeAttribute("studiolist");
		//로그인체크
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		//연습실 목록 세션 재설정
		StudioResDAO dao = new StudioResDAO();
		String host_id = (String)session.getAttribute("host_id");
		List<StudioVO> studiolist = dao.selectStudioByHostId(host_id);
		session.setAttribute("studiolist", studiolist);	
		
		RequestDispatcher rd = request.getRequestDispatcher("hostMain.jsp");
		rd.forward(request, response);
		return;
	}
}
