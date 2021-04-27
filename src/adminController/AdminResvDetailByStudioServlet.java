package adminController;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet("/admin/adminResvDetailByStudio")
public class AdminResvDetailByStudioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		List<ReservationsVO> originReslist = dao.selectReservationsAll();
		List<ReservationsVO> filteredReslist = new ArrayList<ReservationsVO>();
		for(ReservationsVO vo:originReslist) {
			if(vo.getStudio_no()==studio_no) {
				filteredReslist.add(vo);
			}
		}
		request.setAttribute("reservationlist", filteredReslist);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("adminSearchResAll.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
