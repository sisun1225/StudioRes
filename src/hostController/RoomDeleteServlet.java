package hostController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RoomVO;
import model.StudioResDAO;

/**
 * Servlet implementation class roomDeleteServlet
 */
@WebServlet("/host/roomDelete")
public class RoomDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("host_no") == null) {
			response.sendRedirect("hostLogin");
			return;
		}
		StudioResDAO dao = new StudioResDAO();
		RoomVO room = new RoomVO();
		int room_no = Integer.parseInt(request.getParameter("room_no").trim());
		String studio_no = request.getParameter("studio_no");
		room.setRoom_no(room_no);
		room.setStudio_no(Integer.parseInt(studio_no));
		
		dao.deleteRoom(room);
		
		response.sendRedirect("studioDetail?studio_no="+studio_no);
		
	}


}
