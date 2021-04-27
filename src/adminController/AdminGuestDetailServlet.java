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
import model.StudioResDAO;
import model.StudioVO;

@WebServlet("/admin/adminGuestDetail")
public class AdminGuestDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		int guest_no = Integer.parseInt(request.getParameter("guest_no"));
		List<ReservationsVO> reservationlist = dao.selectResvByGuestNo(guest_no);
		request.setAttribute("reservationlist", reservationlist);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminGuestDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
