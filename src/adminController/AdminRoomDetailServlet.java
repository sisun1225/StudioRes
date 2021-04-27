package adminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestVO;
import model.ReservationsVO;
import model.RoomVO;
import model.StudioResDAO;
import model.StudioVO;

@WebServlet("/admin/adminRoomDetail")
public class AdminRoomDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		List<RoomVO> roomlist = dao.selectRoomById(studio_no);
		request.setAttribute("roomlist", roomlist);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminRoomDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
