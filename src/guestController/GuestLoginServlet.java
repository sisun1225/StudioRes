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


@WebServlet("/guest/login")
public class GuestLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String before_address = request.getHeader("Referer");
		session.setAttribute("before", before_address);
		
		if(session.getAttribute("guest_id")!=null) {
			response.sendRedirect(before_address);
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("guestLogin.jsp");
		rd.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		
		String guest_id = request.getParameter("guest_id");
		String guest_pw = request.getParameter("guest_pw");
		GuestVO guest = dao.guestLoginChk(guest_id, guest_pw);

		HttpSession session = request.getSession();
		String before = (String)session.getAttribute("before");
		
		session.removeAttribute("before");
		if(guest != null) {
			session.setAttribute("guest_id", guest_id);
			session.setAttribute("guest_pw", guest_pw);
			session.setAttribute("guest_name", guest.getGuest_name());
			session.setAttribute("guest_no", guest.getGuest_no());
			response.sendRedirect(before);
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("guestLogin.jsp");
		rd.forward(request, response);
		return;
	}

}
