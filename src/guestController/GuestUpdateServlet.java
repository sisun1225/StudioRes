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


@WebServlet("/guest/update")
public class GuestUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String guest_id = request.getParameter("guest_id");
		String guest_pw = request.getParameter("guest_pw");
		String guest_name = request.getParameter("guest_name");
		String guest_email = request.getParameter("guest_email");
		String guest_phone = request.getParameter("guest_phone");
		
		StudioResDAO dao = new StudioResDAO();
		int result = dao.updateGuest(guest_id, guest_pw, guest_name, guest_phone, guest_email);
		
		HttpSession session = request.getSession();
		session.removeAttribute("guest_pw");
		session.removeAttribute("guest_name");
		
		session.setAttribute("guest_pw", guest_pw);
		session.setAttribute("guest_name", guest_name);
		System.out.println("sdf");
		response.sendRedirect("login");
	}

}
