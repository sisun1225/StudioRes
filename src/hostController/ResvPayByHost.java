package hostController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudioResDAO;

/**
 * Servlet implementation class ResvPayByHost
 */
@WebServlet("/host/resvPayByHost")
public class ResvPayByHost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudioResDAO dao = new StudioResDAO();
		int resv_no = Integer.parseInt(request.getParameter("resv_no"));
		System.out.println(resv_no);
		int studio_no = Integer.parseInt(request.getParameter("studio_no"));
		int result = dao.updateReservationPay(resv_no);
		System.out.println("result?? :"+result);
		request.setAttribute("studio_no",studio_no);
		RequestDispatcher rd = request.getRequestDispatcher("resvChkByHost.jsp");
		rd.forward(request, response);
	}
}
