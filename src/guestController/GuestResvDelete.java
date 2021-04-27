package guestController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudioResDAO;


@WebServlet("/guest/resvDelete")
public class GuestResvDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int resv_no = Integer.parseInt(request.getParameter("resv_no"));
		StudioResDAO dao = new StudioResDAO();
		int result = dao.deleteResv(resv_no);
		
		response.sendRedirect("login");
	}

}
