package guestController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GuestVO;
import model.StudioResDAO;


@WebServlet("/guest/insert")
public class GuestInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		RequestDispatcher rd = request.getRequestDispatcher("guestInsert.jsp");
  		rd.forward(request, response);
  	}
  	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String guest_id = request.getParameter("guest_id");
		String guest_pw = request.getParameter("guest_pw");
		String guest_name = request.getParameter("guest_name");
		String guest_email = request.getParameter("guest_email");
		String guest_phone = request.getParameter("guest_phone");
		
		GuestVO guest = new GuestVO(0, guest_id, guest_pw, guest_name, guest_phone, guest_email);
		StudioResDAO dao = new StudioResDAO();
		int result = dao.insertGuest(guest);
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('이미 있는 아이디 입니다.');"
					+ "location.href='insert';</script>");
			writer.close();
			
		}else {
			response.sendRedirect("login");
		}
		
	}

}
