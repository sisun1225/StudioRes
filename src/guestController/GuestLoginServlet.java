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

/*
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      HttpSession session = request.getSession();
      String page = "hostLogin.jsp";
      if(session.getAttribute("host_id")!=null) {
         page = "hostMain.jsp";
      }
      RequestDispatcher rd = request.getRequestDispatcher(page);
      rd.forward(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      StudioResDAO dao = new StudioResDAO();

      String host_id = request.getParameter("host_id");
      String host_pw = request.getParameter("host_pw");
      HostVO host = dao.loginChk(host_id,host_pw);
      String page = "hostLogin.jsp";
      HttpSession session = request.getSession();
      if(host != null) {
         session.setAttribute("host_id", host_id);
         session.setAttribute("host_pw", host_pw);
         session.setAttribute("host_name",host.getHost_name());
         page = "hostMain.jsp";
      }
      RequestDispatcher rd = request.getRequestDispatcher(page);
      rd.forward(request, response);
   }
 */


@WebServlet("/guest/login")
public class GuestLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String page = "guestLogin.jsp";
		if(session.getAttribute("guest_id")!=null) {
			page = "guestMain.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();

		String guest_id = request.getParameter("guest_id");
		String guest_pw = request.getParameter("guest_pw");
		GuestVO guest = dao.guestLoginChk(guest_id, guest_pw);
		String page = "guestLogin.jsp";
		HttpSession session = request.getSession();
		if(guest != null) {
			session.setAttribute("guest_id", guest_id);
			session.setAttribute("guest_pw", guest_pw);
			session.setAttribute("guest_name",guest.getGuest_name());
			page = "guestMain.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
