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


@WebServlet("/host/studioUpdatePage")
public class StudioUpdatePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//get방식 요청시 처리필요


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		StudioResDAO dao = new StudioResDAO();
		StudioVO studio =  dao.selectStudioByNo(studio_no);
		String[] simpleAddress = studio.getStudio_address().split(",");
		studio.setStudio_address(simpleAddress[0].trim());
		String detailAddress = simpleAddress[1].trim();
		request.setAttribute("studio", studio);
		request.setAttribute("detailAddress", detailAddress);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("hostUpdateStudio.jsp");
		rd.forward(request, response);
	}

}
