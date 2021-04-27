package guestController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GuestVO;
import model.StudioResDAO;


@WebServlet("/guest/info")
public class GuestInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		StudioResDAO dao = new StudioResDAO();
		String guest_id = (String)session.getAttribute("guest_id");		
		GuestVO guest = dao.selectGuestById(guest_id);

		request.setAttribute("guest", guest);
		RequestDispatcher rd = request.getRequestDispatcher("guestInfo.jsp");
		rd.forward(request, response);
	}

}
