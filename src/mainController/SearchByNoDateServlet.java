package mainController;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ReservationsVO;
import model.StudioResDAO;
import model.StudioVO;


@WebServlet("/main/searchByNoDate")
public class SearchByNoDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String s_radio = request.getParameter("radioVal"); 
		 int i_radio =Integer.parseInt(s_radio); 
		 String s_date = request.getParameter("dateVal");
		 Date d_date= Date.valueOf(s_date);
		 
		 StudioResDAO dao = new StudioResDAO();
		 
		 List<ReservationsVO> resvList = dao.selectResvByRoomNoDate(d_date, i_radio);
		 
		 request.setAttribute("resvList", resvList);
		 request.setAttribute("i_radio", i_radio);
		 request.setAttribute("d_date", d_date);
		 	  
		RequestDispatcher rd = request.getRequestDispatcher("resvTimeList.jsp");
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("guest_no") == null) {
			response.sendRedirect("/StudioRes/guest/login");
			return;
		}
		
		int insertGuestNo = (Integer)(session.getAttribute("guest_no"));
		int insertRoomNoVal = Integer.parseInt(request.getParameter("insertRoomNoVal")); 
		Date insertDateVal = Date.valueOf(request.getParameter("insertDateVal")); 
		String[] s_insertTimeArr = request.getParameterValues("resvChk");
		
		StudioResDAO dao = new StudioResDAO();
		
		for(String insertTimeArr : s_insertTimeArr) {
			ReservationsVO reservation = new ReservationsVO();
			reservation.setGuest_no(insertGuestNo);
			reservation.setRoom_no(insertRoomNoVal);
			reservation.setResv_date(insertDateVal);
			reservation.setResv_time(Integer.parseInt(insertTimeArr));	
			int result = dao.insertReservation(reservation);
		}
		
		response.sendRedirect("searchAll");
	}
}


