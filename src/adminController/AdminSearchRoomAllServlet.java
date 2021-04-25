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
import model.RoomVO;
import model.StudioResDAO;

/**
 * Servlet implementation class AdminSearchRoomAllServlet
 */
@WebServlet("/admin/adminSearchRoomAll")
public class AdminSearchRoomAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		List<RoomVO> roomlist = dao.selectRoomsAll();
		request.setAttribute("roomlist", roomlist);	
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminSearchRoomAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
