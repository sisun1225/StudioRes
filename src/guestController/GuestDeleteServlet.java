package guestController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestVO;
import model.StudioResDAO;


@WebServlet("/guest/delete")
public class GuestDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String guest_id = (String)request.getParameter("guest_id");
		StudioResDAO dao = new StudioResDAO();
		GuestVO guest = dao.selectGuestById(guest_id);
		int result = dao.deleteGuest(guest_id, guest.getGuest_pw());
		
		response.sendRedirect("logout");
	}

}
