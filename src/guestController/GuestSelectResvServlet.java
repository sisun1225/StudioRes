	package guestController;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GuestVO;
import model.ReservationsVO;
import model.StudioResDAO;


@WebServlet("/guest/resvlist")
public class GuestSelectResvServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  		HttpSession session = request.getSession();
		StudioResDAO dao = new StudioResDAO();
		String guest_id = (String)session.getAttribute("guest_id");
		GuestVO guest = dao.selectGuestById(guest_id);
		List<ReservationsVO> resvlist = dao.selectResvByGuestNo(guest.getGuest_no());

		request.setAttribute("resvlist", resvlist);
		RequestDispatcher rd = request.getRequestDispatcher("guestResvlist.jsp");
		rd.forward(request, response);
  	
  	}

}
